import { LightningElement,wire } from 'lwc';
//import userId from '@salesforce/user/Id';
import showOrder from '@salesforce/apex/orderCard.showOrder';

const columns = [
    {
        label : "Order Name",
        fieldName : "Name"
    },
    {
        label : "Warranty Date",
        fieldName : "Warranty_End_Date__c"
    },
    {
        label : "Warranty Status",
        fieldName : "Warranty_Status__c"
    }
]
export default class OrderCard extends LightningElement {

    //userId = userId;
    columns = columns;
    data;
    warrantyEndDate;
    
    @wire(showOrder)
    wiredMethod({ data, error }) {
        if (data) {
            this.data = data;

            // this.warrantyEndDate = data[0].Warranty_End_Date__c;

            // console.log('<----data---->', data);
            // console.log('<----Warranty End Date---->', this.warrantyEndDate);

            /*const enriched = data.map(record => {
                return { ...record, warrantyStatus: new Date(record.Warranty_End_Date__c).getMonth - new Date().getMonth() <= 0 ? 'Expired' : 'Active' };
            });
            this.data = enriched;
            console.log('<----data---->', this.data);*/
        }

        if (error) {
            console.log(error);
        }
    }

}