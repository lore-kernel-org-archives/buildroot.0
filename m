From: bruce bushby <bruce.bushby@gmail.com>
Date: Sat, 19 Mar 2011 12:04:24 +0000
Subject: [Buildroot] [buildroot] libdrm tries to compile before cairo
In-Reply-To: <AANLkTikSKFvf6aLE2M3m5G3CVXzf0EKiXu8UZWbDA=jn@mail.gmail.com>
References: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
	<20110319082240.7757e09c@surf>
	<AANLkTi=qzgpvb9p3aKAtkQG0PhdFC98Lq8k5fT8qTUmq@mail.gmail.com>
	<20110319105833.329c099a@surf>
	<AANLkTi=bFZ5MepDorK_6i1soraZGqw7B2T25HRZcH6D-@mail.gmail.com>
	<AANLkTikSKFvf6aLE2M3m5G3CVXzf0EKiXu8UZWbDA=jn@mail.gmail.com>
Message-ID: <AANLkTik68dGgX5NfjZMehTpCGsNn+bwBa6tECQFpvr4B@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"...Yes, our udev is very old. We have patches to bump udev, but
they haven't been merged yet"

ahh...cheers Thomas!! That probably explains an error I'm getting when I
boot 2.6.38 kernel:

INIT: version 2.88 booting
Populating /dev using udev: udevd (898): /proc/898/oom_adj is deprecated,
please use /proc/898/oom_score_adj instead.


Any ideas when a newer version would be available via the "daily snapshot"?
I would like to help more but not a lot I can do beyond testing :(


Barry: Try moving your build platform to a "virtual guest", it makes life a
lot easier running "main stream flavors" without having to contaminate your
"base machine"


Bruce






On Sat, Mar 19, 2011 at 11:29 AM, Barry Kauler <bkauler@gmail.com> wrote:

> On 3/19/11, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>
> > Ugly. Really.
>
> Er, yes, of course I know that. I did those quick hacks as I wanted to
> get as far as compiling X.org.
>
> In no way do I imply that those ugly hacks are what I will do
> permanently. If I keep using Buildroot, then I will submit bug reports
> and solve the problems. As I learn more about Buildroot, I will also
> be able to solve some of the problems properly myself.
>
> As already stated, I will in future be using a more Buildroot-friendly
> Linux host.
>
> Regards,
> Barry Kauler
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110319/fdb7d9c1/attachment.html>
