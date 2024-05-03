$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"

require 'redmine'
require_dependency 'private_wiki/hook'
require_dependency 'private_wiki/wiki_controller_patch'
require_dependency 'private_wiki/wiki_page_patch'
require_dependency 'private_wiki/macros_patch'

WikiController.send(:include, PrivateWiki::WikiControllerPatch)
WikiPage.send(:include, PrivateWiki::WikiPagePatch)
Redmine::WikiFormatting::Macros::Definitions.send(:include, PrivateWiki::MacrosPatch)

Redmine::Plugin.register :redmine_private_wiki do
  name 'Private Wiki'
  author 'Oleg Kandaurov'
  description 'Adds private pages to wiki'
  version '0.2.3'
  author_url 'http://f0y.me'
  requires_redmine :version_or_higher => '5.0'

  project_module :wiki do
    permission :view_private_wiki_pages, {}
    permission :manage_private_wiki_pages, {:wiki => :change_privacy}, :require => :member
  end

end
