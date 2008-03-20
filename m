From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 20 Mar 2008 14:42:03 +0100
Subject: [Buildroot] updating package/mtd
References: <20080318063516.GA607@cloud.net.au>
	<048001c88a0a$8a2696f0$070514ac@atmel.com>
	<20080319234917.GC17292@cloud.net.au>
	<00e801c88a6e$47078550$040514ac@atmel.com>
	<20080320102730.GA1454@cloud.net.au>
Message-ID: <00c401c88a95$dff82180$e0c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Hamish Moffatt" <hamish@cloud.net.au>
To: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
Cc: <buildroot@uclibc.org>
Sent: Thursday, March 20, 2008 11:27 AM
Subject: Re: [Buildroot] updating package/mtd


> On Thu, Mar 20, 2008 at 09:57:13AM +0100, Ulf Samuelsson wrote:
>> >> > I'm going to update package/mtd to support a newer version, because I
>> >> > need access to ubi and other new tools.
>> >> > 
>> >> > Using the MTD snapshot version seems to be broken - there are no
>> >> > snapshots on the ftp.uk.linux.org server any more. Also I think we could
>> >> > merge the makefiles for the 2005* and 2006* versions.
>> >> > 
>> >> > Any comments, thoughts, objections, requests?
>> >> 
>> >> If you want to work on this, you need to test the result on AT45 dataflash.
>> >> Unless you have access to such a target, I suggest you leave the 2006 support there
>> >> and add yet another version.
>> > 
>> > OK. Is AT45 dataflash not working in the current git version, or 1.1.0?
>> > Do we need the 2005* version as well, and also the 1.1.0 release which
>> > is the latest of the 3 current working options?
>> > 
>> 
>> Have no clue if it is working in the git.
>> I know 2005 isn't, but I could not test on a multitude of targets,
>> therefore I added 2006 (which works for AT45) but allowed
>> people to keep 2005.
>> IIRC, There are different directory structures between 2005 and 2006,
>> making it hard to share makefiles.
>> 
>> > I need something from git myself to get access to the ubi tools.
>> > 
>> 
>> Suggest you use a separate makefile for the latest version to avoid trouble.
>> AT91 should use 2006 by default.
> 
> OK. I was going to remove the snapshot from the 2005* makefile and
> create a separate one. That will make it all slightly tidier and
> symmetric at least.
> 


That makes sense to me.
No need for snapshot support in 2005 or 2006.


Best Regards
Ulf Samuelsson
