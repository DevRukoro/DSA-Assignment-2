import ballerina/graphql;
import ballerina/sql;
import ballerina/http;
import ballerina/io;

// Define a Ballerina client to interact with the GraphQL service.
public function main() {
    // Define the GraphQL server endpoint.
    string endpointUrl = "http://localhost:4000/graphql"; 
    // Sample GraphQL query for HoD, Supervisor, and Employee actions.
    string hodQuery = """
    query {
        departmentObjectives {
        string id;
        string Firstname;
        float percentage;
            
            
        }
    }
    """;

    string supervisorQuery = """
    query {
        employeeScores {
            // Define the
        }
    }
    """;

    string employeeQuery = """
    query {
        myScores {
            // Define
        }
    }
    """;

    // Sample GraphQL mutation for HoD, Supervisor, and Employee actions.
    string hodMutation = """
    mutation {
        createDepartmentObjective(input: {
        departmentTable.add({id: ide, ...data});
        departmentTable.add({id: newDepartment.id, Firstname:newDepartment.Firstname, percentage:newDepartment.percentage});
        return newDepartment.Firstname + "saved successfuly";
        }) 
    }
    """;

    string supervisorMutation = """
    mutation {
        approveKPI(input: {
            string id;
            string Firstname;
            string Unit;
        }) {
            // Define the fields you want to retrieve in the response.
        }
    }
    """;

    string employeeMutation = """
    mutation {
        createKPI(input: {
            // Define the input fields for creating KPIs.
        }) {
            // Define the fields you want to retrieve in the response.
        }
    }
    """;

    // Define authentication token or headers for user role.
    map<string> headers = {
        // Define authentication headers if required.
    };

    // Send the GraphQL request to the server.
    var hodResponse = graphql:execute(endpointUrl, hodQuery, headers);
    var supervisorResponse = graphql:execute(endpointUrl, supervisorQuery, headers);
    var employeeResponse = graphql:execute(endpointUrl, employeeQuery, headers);

    // Handle the responses.
    if (hodResponse is http:Response) {
        // Handle the HoD response.
        io:println("HoD Response: " + hodResponse.getTextPayload());
    } else {
        // Handle errors.
        io:println("Error: " + hodResponse.toString());
    }

    if (supervisorResponse is http:Response) {
        // Handle the Supervisor response.
        io:println("Supervisor Response: " + supervisorResponse.getTextPayload());
    } else {
        // Handle errors.
        io:println("Error: " + supervisorResponse.toString());
    }

    if (employeeResponse is http:Response) {
        // Handle the Employee response.
        io:println("Employee Response: " + employeeResponse.getTextPayload());
    } else {
        // Handle errors.
        io:println("Error: " + employeeResponse.toString());
    }
}
