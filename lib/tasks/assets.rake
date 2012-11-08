# http://stackoverflow.com/questions/9459369/rails-3-2-1-assets-precompiled-twice-on-deploy
# override the default assets precompile task so that the nondigest task does not run
Rake::Task['assets:precompile:all'].clear
namespace :assets do
  namespace :precompile do
    task :all do
      Rake::Task['assets:precompile:primary'].invoke
      # ruby_rake_task("assets:precompile:nondigest", false) if Rails.application.config.assets.digest
    end
  end
end
