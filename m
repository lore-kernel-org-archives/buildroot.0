From: digitalpeer <buildroot@digitalpeer.com>
Date: Tue, 1 Apr 2008 17:28:38 -0700
Subject: [Buildroot] [PATCH] add romfs support
In-Reply-To: <20080402002005.GC4616@cloud.net.au>
References: <3530b0eb0804011424t3d88f2f2sc6777f9d7a9edf57@mail.gmail.com>
	<20080402002005.GC4616@cloud.net.au>
Message-ID: <3530b0eb0804011728j45dd33e9j3edb7acc238d83ca@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hmm, I'll send future patches as attachments if you prefer?

On Tue, Apr 1, 2008 at 5:20 PM, Hamish Moffatt <hamish@cloud.net.au> wrote:

> On Tue, Apr 01, 2008 at 02:24:00PM -0700, digitalpeer wrote:
> > The following patch adds the ability to generate a romfs image using
> genromfs.
>
> Thanks, committed in rev 21618.
>
> Two notes;
>
> 1. Your patch was word-wrapped in a few places.
>
> 2. Needed to edit target/Config.in to include target/romfs/Config.in
> also. I guess you did this but forgot to send the patch.
>
>
> Hamish
> --
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080401/ce9d1260/attachment.htm 
