From: Darius Augulis <augulis.darius@gmail.com>
Date: Sun, 22 Aug 2010 19:19:57 +0300
Subject: [Buildroot] [PATCH 0/2] Add support for Alix2d3 board from PC
	Engines
In-Reply-To: <20100806225032.669dfa12@surf>
References: <20100712204654.17842.63829.stgit@darius-desktop>	<4C5C5EB1.4020500@gmail.com>
	<20100806225032.669dfa12@surf>
Message-ID: <4C714E2D.3050907@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hello,

On 08/06/2010 11:50 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 06 Aug 2010 22:12:49 +0300
> Darius Augulis<augulis.darius-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>
>> Did anybody review it? Maybe it's ready to merge it to main line?
>
> As 2010.08-rc1 has been released, only bug fixes will be merged until
> the release of 2010.08.
>
> My top-priority item for 2010.11 is to cleanup the board support in
> Buildroot (I already have a stack of patches started on this topic). As
> part of this effort, I intend to merge all pending contributions that
> add board support.
>
> However, I don't consider this one as ready, as it adds a new complete
> target skeleton for just a new Grub configuration, as discussed a week
> ago on the list. We need to find a different solution to this than
> duplicating the target skeleton.

I have another similar patch adding other device support, also with 
skeleton...
One possible solution could be directory per device containing ONLY 
specific and custom files to particular device. Some script should copy 
these files to output rootfs directory after copying default skeleton 
files (rewriting existing ones if needed). In this case, default 
skeleton would be the same for all devices.
What do you think about such idea?

Darius.

>
> Thanks,
>
> Thomas
