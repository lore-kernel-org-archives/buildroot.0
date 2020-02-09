From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 9 Feb 2020 21:05:13 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-02-06
In-Reply-To: <87a75uyaqe.fsf@dell.be.48ers.dk>
References: <20200207072841.EC07F87D33@hemlock.osuosl.org>
 <20200207111804.GB298248@momiji> <87a75uyaqe.fsf@dell.be.48ers.dk>
Message-ID: <20200209210513.GB517066@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 07 Feb 2020 11:04:25 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
>  > On Fri, 07 Feb 2020 07:28:36 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>  >> Detail of failures
>  >> ------------------
>  >> 
>  >> arch     |             reason             | OK? |                                       url                                       | orph?
>  >> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>  >> aarch64    |        webkitgtk-2.26.2        | NOK | http://autobuild.buildroot.net/results/634087c9aee94032adc4deb9cb21a422cdf2e361 |     
> 
>  > This would be fixed by having CMake 3.10+ installed in the host.
> 
>  > Buildroot commit 65205c2425bccb7039ca0e2caffb7c64c26805f7 updated host-cmake
>  > to 3.10 but then it was reverted by 5b57ae7ad197fd641c233f22d326c846b9ea2204.
> 
>  > So I suppose that the builder either does not have CMake installed in the
>  > system, or that it is older than 3.10 so host-cmake is built instead? But
>  > currently host-cmake is version 3.8 ?\_(?)_/? 
> 
> Notice that this is only for 2019.02.x. Master already ensures cmake is
> 3.10+. Given that 2019.02.x is just about to go EOL and the issues we
> had in the past with building newer cmake versions with old host
> toolchains / dependencies, I think the least bad solution is to just
> keep it like this.

Indeed, you make a very good point. Let's keep thing as-is then :-)

Cheers,
?Adrian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200209/035da2e6/attachment.asc>
