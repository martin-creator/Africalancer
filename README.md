# Africalancer-connecting african talent with opportunities
![header](/images/header.png)
> The pandemic exposed that Africa's lack of digital work infrastructure has the potential to disrupt the way work was actually working.  We need to creates digital spaces to network and create projects outside the conventional four cournes of the offices/classroom.   The lack of digital work infrastructure has led to scenarios where talent is  equally distributed however, opportunity  is not. At Africalancer, we hope to change this narrative by creating  leveled plaform for talent to connect with opportunity. 


> Live demo [Project will soon be moved to  the cloud](#). <!-- If you have the project hosted somewhere, include the link here. -->

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Usage](#usage)
* [Project Status](#project-status)
* [Room for Improvement](#room-for-improvement)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)
<!-- * [License](#license) -->


## General Information

Today, more than 60% of Africa’s population is under the age of 25. By 2030, young Africans are expected to constitute 42% of global youth.  This is a great work force  that  can propel  the future of the continent forward if only we can  create  networking opportunities  for our youth to grow their skills.  In Africa, we dont have infrastructure to supporyt the connectintu of talent and opportunity that is awesome. 

Africalancer comes in  to provide infrastructure to connect talent and opportunity to catalayze Africa's economic prosperity.  Our UX/UI from the very start takes into account the local digital literacy among our prospective users.  Additionally,  we enable our users to create wages which enables them to create fair deals that would otherwise be hard in realife. We also create  a space for  business owners to access  diverse talent for their jobs. 


To this end, it is clear that Airlancer gains pride in leading the race to  provide infrastructure for Africa's digital economy.



## Technologies Used

### 1. Backend Dependencies
Our tech stack includes the following:
- Ruby - version 2.6.2
- Rails - version 6.0.6
- Postgress (Database)
- Check the [Gemfile](./Gemfile) for other dependencies. You should be careful when changing any   gem versions as this  can break the application. 

### 2. Frontend Dependencies
Our tech stack includes the following:
- Bootstrap -version 4.0.0
- Javascript-jquery
- HTML
- CSS


## Features

Ready features:

- Verifying identity with social
- User Profile features (avatar, bio, location, etc) just like Fiverr
- User Dashboard managing all of jobs, requests and offers
- Posting job in steps (including how to use ActionText with drag and drop photos)
- Creating requests for freelancers
- Making offers to clients' requests
- Managing both Buying and Selling orders
- Accept/Reject multiple offers
- User settings for Payment and Payout methods
- Earning Dashboard listing all history transactions for revenue and expenses
- Sending SMS Notification when a seller got new sales
- User identification with SMS (via mobile #) 
- Credit Card processing with Stripe when buying a service
- Build your own Wallet system handling income and expense
- Build the Super Admin Dashboard (back-end) monitoring everything like Categories, Users, Jobs, for the whole platform
- Super Admin can approve/reject Withdraw requests from sellers
- Super Admin can view the Wallet history of specific users
- Especially, the Escrow System that keeps track of funds per user and payout accordingly via Paypal API
- Real-time Private Message with ActionCable
- Attaching files to the conversation between sellers and buyers
- Monthly Subscription Business system
- Create Subscription Plans with $ via Stripe API
- SuperHandle events via Stripe webhooks like subscribing, cancelling, etc
- SuperSmart Calendar for monitoring job deadline with notification




## Screenshots

![photo](/images/fiver-1.png)
![photo](/images/fiver-2.png)
![photo](/images/fiver-3.png)
![photo](/images/fiver-4.png)
![photo](/images/fiver-5.png)
<!-- If you have screenshots you'd like to share, include them here. -->


## Setup

* This project was built on ruby 2.6.2 and rails 6.0.6, if you using Ubuntu, follow the steps below to install rails:
``` 
1 - sudo apt update #update system repos
2 - sudo apt install git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev #ruby libraries and compilers
3- curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash # install rbenv2
    #Bash commands to update .bashrc file
4 - echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc

5 - rbenv -v # check rbenv version
6 - rbenv install -l # check versions of ruby on the systme
7 - rbenv install [version number] # install a specific ruby version
8 - rbenv global [version number] # make installed ruby version as the global version
9 - ruby --version # check ruby version
10 - gem install bundler # install bundler 
10 - gem install rails -v @version number # install rails
11 - rails -version  # check the rails version
12 - git clone @africalancer git repo
13 - cd @africalancer directory
14 - bundle # install gem dependences
15 - rails start # start your rails application


```
Incase you get any errors during installation, you can delete the **Gemfile.lock** and then run **bundle** again. 


## Usage

This project is a template for  any marketplace business models  that have booking,  review, payments, and job creation in the functionality.  It is therefore very possible for anyone to use it as a starting point to build a startup  to improve   lives in your community and even your own life!


## Project Status

Project is: _in progress_ 


## Room for Improvement

Room for improvement:
- Refactoring code to follow DRY & KISS principles
- Upgrading codebase to  newer ruby and rails  versions
- Include documentation in ruby and html files
- Clean code to remove any comments

To do:
- Prepare app for deployment
- Integrate mobile money payments
- Include online status messaging functionality


## Acknowledgements

- This project was inspired by [Code4Startup](https://code4startup.com/)
- Many thanks to [Leo Chan](https://hk.linkedin.com/in/leowchan) for giving me a scholarship to hone my software engineering skills. 
- <https://www.vultr.com/docs/installing-ruby-on-rails-on-ubuntu-20-04/>
- <https://phoenixnap.com/kb/install-ruby-ubuntu>


## Contact
Created by <martinlubowa@outlook.com> - feel free to contact me!


<!-- Optional -->
<!-- ## License -->
<!-- This project is open source and available under the [... License](). -->

<!-- You don't have to include all sections - just the one's relevant to your project -->


