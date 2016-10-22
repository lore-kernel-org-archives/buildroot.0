From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Oct 2016 14:00:55 +0200
Subject: [Buildroot] [PATCH v2] support/misc/Vagrantfile: bump to ubuntu
	16.04
In-Reply-To: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Mon, 17 Oct 2016 23:53:02 +0200")
References: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87r378bnk8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > * Updating to ubuntu 16.04
 > * Fixing dependencies
 > * Fixing locale complaints
 > * Removing unused packages

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > ---
 > Changelog

 > * Changed to C locale as suggested by Arnout Vandecappelle

 >  support/misc/Vagrantfile | 9 ++++++---
 >  1 file changed, 6 insertions(+), 3 deletions(-)

 > diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
 > index cf269fe..5e56d5d 100644
 > --- a/support/misc/Vagrantfile
 > +++ b/support/misc/Vagrantfile
 > @@ -12,7 +12,7 @@ VM_MEMORY=2048
 >  VM_CORES=1
 
 >  Vagrant.configure('2') do |config|
 > -	config.vm.box = 'ubuntu/trusty64'
 > +	config.vm.box = 'bento/ubuntu-16.04'

What is the reason to use a base image from the bento project instead of
the official ubuntu image?

https://atlas.hashicorp.com/ubuntu/boxes/xenial64

-- 
Bye, Peter Korsgaard
