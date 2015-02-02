var Items = new Meteor.Collection('riotitems');
Meteor.subscribe('riotitems');

Template.body.rendered = function () {
    riot.mount('todo', {
	title: 'I want to behave!',
	items: Items,
    });
};
