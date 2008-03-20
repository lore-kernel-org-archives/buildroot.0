From: Sean Perry <shaleh@speakeasy.net>
Date: Wed, 19 Mar 2008 21:15:58 -0700
Subject: [Buildroot] [PATCH] Allow users to choose Custom
	Skeleton	directory
In-Reply-To: <047f01c88a0a$8a1ef5d0$070514ac@atmel.com>
References: <16135129.post@talk.nabble.com>
	<047f01c88a0a$8a1ef5d0$070514ac@atmel.com>
Message-ID: <47E1E4FE.4090208@speakeasy.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> 
> If someone wants to have a custom skeleton, why not
> create support for a new board where the board makefile
> specifies the target skeleton.
> 
> I can't really see why you want to be able to specify a non-existing skeleton.
> 

because not all of us need or want to go through setting up a board, 
project, et al.

At work we use busybox on IA32 for IA32 and I have to use glibc, so I 
use crosstool as an external toolchain. It all works, and works quite 
well. I just hand hacked the config to use my skeleton, but this is 
definitely a better approach.
