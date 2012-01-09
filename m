From: vbr vbr <vvvg77@gmail.com>
Date: Mon, 9 Jan 2012 14:25:41 -0800
Subject: [Buildroot] genext2fs: couldn't allocate a block (no free space)
In-Reply-To: <87zkdzgva3.fsf@macbook.be.48ers.dk>
References: <CAOrAeonTZC0dXZnNLLfTjrcZHyiTGHRUWcKDO06mz3MOT0Y7CQ@mail.gmail.com>
 <87zkdzgva3.fsf@macbook.be.48ers.dk>
Message-ID: <CAOrAeom9caS+7U3O-5iby8XK-3io_cB+zMQf=vezNxTCgmqrKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

INODES=1010
BLOCKS=98925
genext2fs: couldn't allocate a block (no free space)

Tried incrementing gradually from 11 and ended up at 14.

Thanks
Vincent


On Sat, Jan 7, 2012 at 11:36 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "vbr" == vbr vbr <vvvg77@gmail.com> writes:
>
>  vbr> Hi,
>  vbr> I am using buildroot 2011.11 with x86_64 and hitting this issue
> after enabling
>  vbr> valgrind which made my target fatter:
>  vbr> genext2fs: couldn't allocate a block (no free space)
>
>  vbr> I made this change to work around this issue increasing the number
>  vbr> of BLOCKS, but it's probably not the right thing to do:
>
> 40% is probably a bit extreme. Out of interest, how many blocks did it
> estimate before, and how many did you need?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120109/4595f7eb/attachment.html>
