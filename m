From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 18:39:21 +0200
Subject: [Buildroot] Where do I place patches for my local buildroot?
In-Reply-To: <0855BDD4CF82174A8BE362DE9F27C3BF01E3FEC82D33@pche-exchange>
References: <0855BDD4CF82174A8BE362DE9F27C3BF01E3FEC82D33@pche-exchange>
Message-ID: <20130523183921.6682d295@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Morten Kvistgaard,

On Thu, 23 May 2013 17:05:03 +0200, Morten Kvistgaard wrote:

> I'd like to follow this buildroot concept of "patches". Eg. if I have
> a patch for a package, I place it in the package folder. If I have a
> patch for my linux kernel, I place it in the folder specified by the
> menuconfig. But suppose I have a patch for my Buildroot? Where do I
> place that?
> 
> My current buildroot patch is for "packages/Config.in". (I'm adding
> some of my local packages and so I need to modify the Config.in.) I
> can also imagine other buildroot files, that I want to patch though.
> And if I place them as separate "patches" it'll be easier to upgrade
> ^^

The general recommendation is to create a git branch, and commit your
changes in there.

When a new Buildroot version is released, either rebase your branch on
top of the new Git tag, or merge the new Git tag into your branch.

> Btw, I can see in the maillist that there's supposed to be a "Local
> Packages" in the menuconfig? Is this so? I can't seem to find it.
> (I'm using buildroot 2013.02.)

Can you point the specific e-mail you're referring to?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
