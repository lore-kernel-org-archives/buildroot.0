From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 31 Mar 2018 15:50:44 +0100
Subject: [Buildroot] [PATCH 2/2] woff2: fix static builds
In-Reply-To: <87zi2ovi6s.fsf@dell.be.48ers.dk>
References: <20180327200555.21748-1-aperez@igalia.com>
 <20180327200555.21748-2-aperez@igalia.com>	<87zi2ovi6s.fsf@dell.be.48ers.dk>
Message-ID: <20180331155044.GB14519@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, 31 Mar 2018 09:05:15 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
>  > Include a patch to make CMake correctly find the Brotli libraries when
>  > they have been built as static libraries.
> 
>  > Fixes:
>  > - http://autobuild.buildroot.net/results/f1c4b5aeb12af7b7a3e8ae01c219004ecd9befd6/
>  > - http://autobuild.buildroot.net/results/74d20ff38766466623cc4a9eb18afcda831bc20b/
> 
>  > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> I see in the pull request that you wanted to rework the patch for
> non-pkg-config cases, but I think this is good enough for us for now.

Yes, indeed that's my plan. I've been just very busy with $WORK the last days,
so most likely I'll look into it by the beginning of next week. Indeed, there
is always pkg-config in Buildroot, so for now using this is fine. The main
reason to have a non-pkg-config fallback is to ease compilation for people
using Windows ? I am told that pkg-config works in Windows, but it can be
tricky and many people don't care about using it there.

> Committed, thanks.
> 
> Please send an update when you rework the patch.

Indeed, will do!

I also have pending to check the review comments on the patch set I made to
update to WebKitGTK+ 2.20.0 and re-send. That I might do this weekend :-)

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180331/673579d4/attachment.asc>
