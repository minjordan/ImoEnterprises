//https://trailhead.salesforce.com/content/learn/projects/communicate-between-lightning-web-components?trail_id=build-lightning-web-components
import { LightningElement, api } from 'lwc';

export default class RegisterEntry extends LightningElement {
    @api somevalue;
    handleClick(event) {
        // 1. Prevent default behavior of anchor tag click which is to navigate to the href url
        event.preventDefault();
        // 2. Read about event best practices at http://developer.salesforce.com/docs/component-library/documentation/lwc/lwc.events_best_practices
        const selectEvent = new CustomEvent('select', {
            detail: this.somevalue
        });
        // 3. Fire the custom event
        this.dispatchEvent(selectEvent);
    }

}