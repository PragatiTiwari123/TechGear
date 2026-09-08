import { LightningElement,wire } from 'lwc';
import showCase from '@salesforce/apex/caseCard.showCase';

const columns = [
    {
        label : "CaseNumber",
        fieldName : "CaseNumber"
    },
    {
        label : "Subject",
        fieldName : "Subject"
    },
    {
        label : "Status",
        fieldName : "Status"
    },
    {
        label : "LastModifiedDate",
        fieldName : "LastModifiedDate"
    },
    {
        label : "CreatedDate",
        fieldName : "CreatedDate"
    }
]
export default class CaseCard extends LightningElement {

    columns = columns;
    data;

    @wire(showCase)
    wiredMethod({data,error}){
        if(data){
            this.data = data;
        }
        if(error){
            console.log(error);
        }
    }
}