From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 19 Mar 2008 22:45:09 +0100
Subject: [Buildroot] [PATCH] Allow users to choose Custom Skeleton
	directory
References: <16135129.post@talk.nabble.com>
Message-ID: <047f01c88a0a$8a1ef5d0$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Hi,
> 
> At present, Buildroot allows only 2 skeleton directory for root preparation
> other than those for atmel,amd etc.
> 
> 1. target/generic/target_busybox_skeleton
> 2. target/generic/target_skeleton
> 
> Below patch allows customers to define their own cutom skeleton directory
> and patch.
> 
> I welcome comments and changes or updates required for the same.
> 
> Thanks and regards
> Gururaja
> 

If someone wants to have a custom skeleton, why not
create support for a new board where the board makefile
specifies the target skeleton.

I can't really see why you want to be able to specify a non-existing skeleton.

Best Regards
Ulf Samuelsson
