From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 10:45:22 +0200
Subject: [Buildroot] [PATCH v2] support/misc/Vagrantfile: bump to ubuntu
	16.04
In-Reply-To: <CA+TH9Vn=nu=bGb8BV0rDJSxXeQ-1ZH3abz415q5vbVPEEmerqA@mail.gmail.com>
 (Angelo Compagnucci's message of "Tue, 25 Oct 2016 10:04:19 +0200")
References: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
 <87r378bnk8.fsf@dell.be.48ers.dk>
 <CA+TH9Vn=nu=bGb8BV0rDJSxXeQ-1ZH3abz415q5vbVPEEmerqA@mail.gmail.com>
Message-ID: <87pomolsv1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

Hi,

 >> >  Vagrant.configure('2') do |config|
 >> > -    config.vm.box = 'ubuntu/trusty64'
 >> > +    config.vm.box = 'bento/ubuntu-16.04'
 >> 
 >> What is the reason to use a base image from the bento project instead of
 >> the official ubuntu image?
 >> 
 >> https://atlas.hashicorp.com/ubuntu/boxes/xenial64

 > The official images from Canonical are broken in many ways, for example
 > this bug [1] prevents the image working properly cause it lacks the vagrant
 > user.

 > Bento images are instead very well tested and triaged from the Chef team,
 > you can find more info here [2]

 > [1] https://bugs.launchpad.net/cloud-images/+bug/1569237
 > [2] http://chef.github.io/bento/

Ok, thanks - That would have been useful information in the commit message.

-- 
Venlig hilsen,
Peter Korsgaard 
