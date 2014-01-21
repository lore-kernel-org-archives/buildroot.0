From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Tue, 21 Jan 2014 13:14:02 +0100
Subject: [Buildroot] Do i have to build from scratch everytime ?
Message-ID: <52DE729A0200004600049269@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,


I'm using Buildroot the last version of 2013 and i like that little helper, so thanks for the support. 

I'm trying to lower the startup time of an embedded system and I'd like to check the options available step by step, not all at once. I'm working with it for some months and right now I've got this feeling: to be sure, that the settings are only done the way i picked them, is to do a "clean" before a "make". Not only when the toolchain is changed, randomly i get Images generated, whose actual settings were ignored (like leave out the init system BusyBox - even when deleting it completely from the "build" folder). 

When I make it clean first everything runs smoothly. But it takes forever. I don't have a High-End PC and (based on the settings) a make takes about 45 min. So I'm doing this 5-6 times and the day is over.

That's why I have this question: Do i really have to build from scratch everytime? Or is there some kind of a secure way to patch my Image (or any other method)?

Thanks For your help
Kind Regards

Frank Ihle

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140121/1c8c16c5/attachment.html>
