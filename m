From: Daniel Jabbour <daniel@laptouchinc.com>
Date: Fri, 30 Jan 2009 21:32:27 -0500
Subject: [Buildroot] Won't build kernel
In-Reply-To: <20090130164418.7ea4aca7@danhplaptop>
References: <ED397211-8106-4E05-9702-625310A5CF37@laptouchinc.com>
	<20090130164418.7ea4aca7@danhplaptop>
Message-ID: <92EA9F97-617B-47EF-AFE2-B7D9F3F18005@laptouchinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dan-

Definitely. I thought "make" would just run the menuconfig since that  
was one of the options in the buildroot menu. That is a little  
unintuitive ;-). I copied a default .config into the kernel source  
tree shortly after I mailed the list and all was well. Thanks for the  
reply.

Daniel

--
Daniel Jabbour
Software Engineer
Laptouch, Inc.



On Jan 30, 2009, at 7:44 PM, Dan Lyke wrote:

> On Fri, 30 Jan 2009 18:43:11 -0500
> Daniel Jabbour <daniel@laptouchinc.com> wrote:
>> I'm pretty new to buildroot. However, I have been successfully able
>> to compile a toolchain and root fs. Now I am trying to also compile
>> a kernel using buildroot.
>
> If you haven't used one of the "_defconfig" files (ie: I'm working on
> at at91sam9261-ek board for prototyping, so I do a "make
> at91sam9261_defconfig" to set up default configuration), then you may
> need to do a "make linux26-menuconfig" as a separate step to set up a
> Linux kernel configuration. This will probably also need a whole bunch
> of setup for your board.
>
> Am I making any sense here?
>
> Dan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
