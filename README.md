# Azure Data Factory (ADF) Excel File Copy Project

Creating an Azure Data Factory (ADF) project to copy an Excel file from a source blob container to a destination container using ADF pipeline and Azure Key Vault involves several steps and requires careful orchestration.

## Directory Structure

```
azure-adf-project/
|-- /adf/
| |-- /pipelines/
| | |-- copy-excel-pipeline.json
| |-- /datasets/
| | |-- source-blob-dataset.json
| | |-- destination-blob-dataset.json
|-- /keyvault/
| |-- keyvault-configuration.json
|-- README.md

```
## Steps

### Azure Key Vault Setup (`keyvault/keyvault-configuration.json`):

1. Deploy an Azure Key Vault instance.
2. Store connection strings or SAS tokens for source and destination blob storage accounts in the key vault.

### ADF Datasets (`adf/datasets/`):

#### Source Blob Dataset (`source-blob-dataset.json`):

1. Set up a linked service to the source blob container using the connection string from Azure Key Vault.
2. Define a dataset for the source blob container.

#### Destination Blob Dataset (`destination-blob-dataset.json`):

1. Set up a linked service to the destination blob container using the connection string from Azure Key Vault.
2. Define a dataset for the destination blob container.

### ADF Pipeline (`adf/pipelines/copy-excel-pipeline.json`):

1. Create a pipeline in Azure Data Factory.
2. Add a "Copy Data" activity.
3. Set the source to the source blob dataset and the destination to the destination blob dataset.
4. Map the Excel columns accordingly if needed.

## Execution

1. Trigger the pipeline manually or on a schedule, based on your requirement.

## Additional Notes

- Ensure you have appropriate permissions set for Azure Data Factory to access the Key Vault and the Blob Storage.
- Test the pipeline in ADF's debug mode before triggering it to verify the copy operation.
- Consider monitoring and logging to keep track of pipeline runs.

**Note:** The JSON files mentioned in the directory structure are representative. In a real-world scenario, you would need to configure them using Azure Portal or Azure SDKs to match your exact requirements.
