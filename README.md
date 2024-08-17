"How to add Image Support to a model in Ruby on Rails" by Malachi Rails from October 2022,
https://www.youtube.com/watch?v=n9v-nx-Tsho

rails active_storage:install

rails db:migrate

resources

Model:

validates :url, presence: :true, :format => { :with => URI::regexp(%w(http https)), :images => "Valid URL required"}

validates :title, presence: :true, length: { minimum: 3, maximum: 25 }, uniqueness: true

has_one_attached :image

Form: (url_field or file_field)

<div class="input-field">
<%= form.label :url, style: "display: block" %>
<%= form.url_field :url, class: "validate", required: true %>
</div>

Html:

<p>
<% if resource.image_attached? %>
<%= image_tag(resource.image, style: "height: 20px;") %>
<% end %>
</p>

Controller: (add image to params)

def resources_params
params.required(:resources).permit(:url, :title, :category, :image)
end

"Image Previews with Active Storage in Ruby on Rails 7" by Deanin from June 2023,
https://www.youtube.com/watch?v=nqAnftA8LbA



