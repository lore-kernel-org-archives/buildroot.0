From: Woody Wu <narkewoody@gmail.com>
Date: Sat, 1 Dec 2012 02:14:23 +0000 (UTC)
Subject: [Buildroot] mkcramfs invalid option 'q'
References: <slrnkbg0lg.2kq.narkewoody@zuhnb712.local.com>
 <87fw3rczxp.fsf@dell.be.48ers.dk>
Message-ID: <slrnkbipu6.2ee.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-11-30, Peter Korsgaard
<jacmet@uclibc.org> wrote:
>>>>>> "Woody" == Woody Wu
>>>>>> <narkewoody@gmail.com> writes:
>
> Woody> Hi, list
> Woody> What now concerns me is an warning message in the output of building
> Woody> cramfs image:
>
>
> Woody> ...
> Woody> tdir=/home/buildroot/buildroot-2012.08/output/target
> Woody>
> table='/home/buildroot/buildroot-2012.08/output/build/_device_table.txt'
> Woody> /home/buildroot/buildroot-2012.08/output/host/usr/bin/mkcramfs:
> invalid
> Woody> option -- 'q'
> Woody> ...
>
> Woody> I just want to ensure that this is normal and I don't need to warry
> Woody> about it. Otherwise, please someone tell me a fix.  Thanks!
>
> I looked back in git history, and we have apparently had this -q option
> ever since cramfs support was introduced in 2003! I've removed it now
> from git as mkcramfs doesn't take a -q option, thanks.

Sorry, my understanding .... does it mean this error message is harmless
and I will not show up in furture buildroot versions?

>
> Notice: I would strongly suggest you move to squashfs instead of the
> ancient cramfs.

Thanks for the suggestion, I like to switch to a mordern image format.
cramfs is just a temporary option since at this moment when I was
testing the new kernel, I have to let it work with a verified old
rootfs, which is a cramfs.


-- 
woody
I can't go back to yesterday - because I was a different person then.
