From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 15:22:32 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: bump version to 2.23
In-Reply-To: <OFE5AEB96A.295E7BD5-ON86257BDD.00471B54-86257BDD.0047E652@rockwellcollins.com>
References: <1378337198-29945-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20130905093315.64d800a2@skate>
 <OFE5AEB96A.295E7BD5-ON86257BDD.00471B54-86257BDD.0047E652@rockwellcollins.com>
Message-ID: <20130905152232.445142e5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

On Thu, 5 Sep 2013 08:05:19 -0500, rjbarnet at rockwellcollins.com wrote:

> I will keep that in mind in the future. However, it looks like Peter 
> already committed the linux-pam patch I submitted so I'll just resubmit 
> the util-linux patch.

Sure, of course.

> FYI - regarding the linux-pam package patch -there is a dependancy on 
> host-pkgconf in linux-pam that wasn't previously caught. I was just trying 
> to build linux-pam package by itself and the build was failing during the 
> configure step because a "PKG_CHECK_MODULES" was not being expanded during 
> the autoreconf step.

Yeah, indeed, I also figured that out while reviewing your patch and
having a look at linux-pam configure.in script. I was merely suggesting
that it would have been nice to have this written in the commit log to
help the view, nothing else :)

Thanks again a lot for your contributions, definitely appreciated!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
