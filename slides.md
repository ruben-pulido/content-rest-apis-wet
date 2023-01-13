title: Pages, Page Templates and Content REST APIs
author:
  name: Rubén Pulido
style: basic-style.css
output: index.html
controls: false

--
# Content REST APIs
--
### Open API
- http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-delivery/v1.0/openapi.json
- http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-content/v1.0/openapi.json
- http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-taxonomy/v1.0/openapi.json
--
### Delivery Endpoints (I)
- /sites/{siteId}/site-pages (get)
- /sites/{siteId}/site-pages/{friendlyUrlPath} (get)
- /sites/{siteId}/site-pages/{friendlyUrlPath}/experiences (get)
- /sites/{siteId}/site-pages/{friendlyUrlPath}/experiences/{experienceKey} (get)
- /sites/{siteId}/site-pages/{friendlyUrlPath}/experiences/{experienceKey}/rendered-page (get)
--
### Delivery Endpoints (II)
- /sites/{siteId}/site-pages/{friendlyUrlPath}/rendered-page (get)
--
### Content Management Endpoints (I)
- /sites/{siteId}/display-page-templates (get)
- /sites/{siteId}/display-page-templates/{displayPageTemplateKey} (get)
- /sites/{siteId}/page-definitions/preview (post)
--
### Content Management Endpoints (II)
- /sites/{siteId}/structured-contents (get)
- /structured-contents/{structuredContentId}/versions (get)
- /structured-contents/{structuredContentId}/by-version/{version} (delete)
- /sites/{siteId}/structured-contents/draft (post)
--
### Query Parameters
- fields
- restrictFields
- flatten
- filter
- search
- sort
- page
- embed?
--
### Documentation 
- https://learn.liferay.com/dxp/latest/en/headless-delivery.html
--
### Documentation Consuming APIs (I)
- https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis.html
- https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/consuming-graphql-apis.html
- https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/consuming-rest-services.html
- https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/api-query-parameters.html
- https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/batch-engine-api-basics-importing-data.html
--
### Documentation Consuming APIs (II)
- https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.html
- https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/making-unauthenticated-requests.html
- https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/api-headers-reference.html
--
### Documentation Headless REST APIS (I)
- https://help.liferay.com/hc/en-us/articles/360028726992-Headless-REST-APIs
- https://help.liferay.com/hc/en-us/articles/360039425631-Get-Started-Find-the-API
- https://help.liferay.com/hc/en-us/articles/360039026172-How-To-Invoke-a-Service
- https://help.liferay.com/hc/en-us/articles/360039026192-Making-Authenticated-Requests
- https://help.liferay.com/hc/en-us/articles/360036343132-Working-with-Collections-of-Data
- https://help.liferay.com/hc/en-us/articles/360028727032-Getting-Collections
--
### Documentation Headless REST APIS (II)
- https://help.liferay.com/hc/en-us/articles/360029046631-Pagination
- https://help.liferay.com/hc/en-us/articles/360029046651-Navigating-from-a-Collection-to-its-Elements
- https://help.liferay.com/hc/en-us/articles/360039026212-API-Formats-and-Content-Negotiation
- https://help.liferay.com/hc/en-us/articles/360028727072-OpenAPI-Profiles
- https://help.liferay.com/hc/en-us/articles/360036343152-Filter-Sort-and-Search
- https://help.liferay.com/hc/en-us/articles/360039425651-Restrict-Properties
- https://help.liferay.com/hc/en-us/articles/360036343172-Multipart-Requests
- https://help.liferay.com/hc/en-us/articles/360036343192-How-to-get-siteId
- https://help.liferay.com/hc/en-us/articles/360039026232-Filterable-properties
- https://help.liferay.com/hc/en-us/articles/360036343212-Using-REST-APIs
--
### Documentation GraphQL
- https://help.liferay.com/hc/en-us/articles/360036708571-Making-Authenticated-Requests 
- https://help.liferay.com/hc/en-us/articles/360036343232-GraphQL-APIs
- https://help.liferay.com/hc/en-us/articles/360028727012-Get-Started-Discover-the-API
- https://help.liferay.com/hc/en-us/articles/360029046571-Get-Started-Invoke-a-Service
- https://help.liferay.com/hc/en-us/articles/360029046611-Working-with-Collections-of-Data
- https://help.liferay.com/hc/en-us/articles/360036708591-Mutations
- https://help.liferay.com/hc/en-us/articles/360036343252-Fragments-and-Node-Patterns
- https://help.liferay.com/hc/en-us/articles/360036343272-Language-Negotiation
- https://help.liferay.com/hc/en-us/articles/360039026272-Multipart-Requests
- https://help.liferay.com/hc/en-us/articles/360036343292-Using-GraphQL-APIs
--
### Documentation REST Builder
- https://help.liferay.com/hc/en-us/articles/360036343312-REST-Builder
- https://help.liferay.com/hc/en-us/articles/360036708611-How-to-install-REST-Builder
- https://help.liferay.com/hc/en-us/articles/360039425671-REST-Builder-OpenAPI
- https://help.liferay.com/hc/en-us/articles/360039026292-Developing-an-API-with-REST-Builder
- https://help.liferay.com/hc/en-us/articles/360039425691-Managing-Collections-in-REST-Builder
- https://help.liferay.com/hc/en-us/articles/360039425711-REST-Builder-Scaffolding
- https://help.liferay.com/hc/en-us/articles/360039425731-Support-for-oneOf-anyOf-and-allOf
- https://help.liferay.com/hc/en-us/articles/360039425751-REST-Builder-Liferay-Conventions

--
### Thank you!
<img 
  src="./images/thank-you.png" 
  alt="Thank you" 
  style="margin-left:auto;margin-right:auto;display:block;max-height:470px;max-width:800px;height:auto;width:auto;" />
--
