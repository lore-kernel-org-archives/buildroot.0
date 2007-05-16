From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 16 May 2007 13:52:25 +0200
Subject: [Buildroot] no gcc in rootfs.i386.ext2
In-Reply-To: <464AE973.6080501@belkam.com>
References: <464AC2D4.9080306@belkam.com> <20070516110226.GC6566@aon.at>
	<464AE973.6080501@belkam.com>
Message-ID: <20070516115225.GA8387@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 16, 2007 at 04:22:27PM +0500, Dmitry Melekhov wrote:
>Bernhard Fischer ??????????:
>> On Wed, May 16, 2007 at 01:37:40PM +0500, Dmitry Melekhov wrote:
>>   
>>> Hello!
>>>
>>> Sorry, I'm newbie.
>>> I want get root with gcc installed, gcc is compiled OK, but there is no
>>> gcc in rootfs.i386.ext2.
>>> What can be wrong?
>>> btw, I use yesterday svn...
>>>     
>>
>> I don't remember the exact wording of that option offhand, sorry.
>> Did you select "toolchain on the target" in menuconfig?
>>
>>   
>Yes, shure.

The option is BR2_PACKAGE_GCC_TARGET, just for the record.

Well, installing gcc into the target works for me.
What version of gcc do you use? Is there any mention of
"-target.*install" in your build logs?
