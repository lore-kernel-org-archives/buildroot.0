From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 10 Mar 2008 18:14:04 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package:editors	editors/vi
References: <ADB1372A-7CAA-41A5-A619-09A9DF0A0D0D@valka.is><008b01c88027$780e44a0$040514ac@atmel.com><4D6547F3-9672-4606-90EA-88630B3565E9@valka.is><20080307235344.GA6144@cloud.net.au>
	<87zlt7bmdg.fsf@macbook.be.48ers.dk>
Message-ID: <042e01c882d4$d82aa450$f1c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Peter Korsgaard" <jacmet@uclibc.org>
To: <buildroot@uclibc.org>
Cc: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
Sent: Sunday, March 09, 2008 10:47 PM
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package:editors editors/vi


>>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:
> 
> Hi,
> 
> Hamish> Like Ulf says, it's convenient to be able to grep
> Hamish> package/*/*.mk and now that's broken. I think dividing of the
> Hamish> package/ directory needs discussion first.
> 
> grep -r is your friend.
> 
> I must say I kinda like the splitup of the package dir. The flat tree
> goes back to when we didn't have many packages and no submenus under
> packages. More consistency between menuconfig and the directory
> structure is good thing.
> 
> Hamish> It's not really a crowded directory by modern standards. Our file
> Hamish> systems can cope with much larger directories than that.
> 
> The limiting factor is us humans, not the file systems.
> 

It is not OK, to introduce this without discussing it on the list though.
Luckily, we have a method to resolve a controversy and that is to let Eric decide.
I think we should give him maybe a week, and only if no reply the patches should be reverted.
(With possible resubmit, if Eric comes back later with ACK)

An alternative way of handling the problem is to have TWO trees.

The package tree remains as it is, and then we have a second tree
which contains the configuration files (make & config files) 
and and subdirectories showing the structure of the configuration.
This tree could also contain html documentation of each link.
The second tree would not contain any 




> -- 
> Bye, Peter Korsgaard
>



Best Regards
Ulf Samuelsson
