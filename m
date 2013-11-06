From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 23:16:40 +0100
Subject: [Buildroot] [PATCH] scripts: apply-patches: don't stop if no
 patch is found for a package
In-Reply-To: <527AB58A.9050506@mind.be>
References: <1383656430-29160-1-git-send-email-andi@etezian.org>
 <52793E3A.5060802@mind.be> <20131105201752.GC17791@jack.whiskey>
 <527AB58A.9050506@mind.be>
Message-ID: <20131106231640.703c0893@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 06 Nov 2013 22:32:58 +0100, Arnout Vandecappelle wrote:

>   That's a bug in the gcc package then :-)
> 
>   It should actually be converted to using the default patch strategy 
> instead of post-patch hooks. Let me look into it...

Good luck. The gcc package is special: there is only one location for
the gcc patches (i.e package/gcc/<version>/), but there are in fact
three gcc packages (package/gcc/gcc-{initial,intermediate,final}).

I'm impatient to see what your solution will be :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
