From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 19 Mar 2008 21:46:24 -0700 (PDT)
Subject: [Buildroot] [PATCH] Allow users to choose Custom
	Skeleton	directory
In-Reply-To: <47E1E4FE.4090208@speakeasy.net>
References: <16135129.post@talk.nabble.com>
	<047f01c88a0a$8a1ef5d0$070514ac@atmel.com>
	<47E1E4FE.4090208@speakeasy.net>
Message-ID: <16171529.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

>
>Ulf Samuelsson wrote:
>> 
>> If someone wants to have a custom skeleton, why not
>> create support for a new board where the board makefile
>> specifies the target skeleton.
>> 
>> I can't really see why you want to be able to specify a non-existing
>> skeleton.
>> 
>
>because not all of us need or want to go through setting up a board, 
>project, et al.
>
>At work we use busybox on IA32 for IA32 and I have to use glibc, so I 
>use crosstool as an external toolchain. It all works, and works quite 
>well. I just hand hacked the config to use my skeleton, but this is 
>definitely a better approach.


shaleh, i 2nd you

Ulf Samuelsson, I use most of the stuff that comes with default config.in
but i want to use a different skeleton, with our own customs directories,
file, device nodes. I dont want to add code to all the places inside target,
with board specific parameters. i just want to have my own skeleton and use
default config  values. So adding this patch, would allow me to specify
custom skeleton instead of hacing the config files. 

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/-PATCH--Allow-users-to-choose-Custom-Skeleton-directory-tp16135129p16171529.html
Sent from the BuildRoot mailing list archive at Nabble.com.
