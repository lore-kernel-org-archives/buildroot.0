From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 May 2017 06:39:36 -0500
Subject: [Buildroot] Analysis of build results for 2017-05-13
In-Reply-To: <20170514144956.77fbdca3@free-electrons.com>
References: <20170514063046.C79A9220A8@mail.free-electrons.com>
 <20170514144956.77fbdca3@free-electrons.com>
Message-ID: <CANQCQpbDHNzFjhPOxLWuPntRPqJwiPZL5q-jtOGH5b7iomx1_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, May 14, 2017 at 7:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>

<snip>

>>      sparc64 |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/c2f6f477dc510484ea126742508ff8e526f43b40 |
>
> Weird:
>
> /usr/bin/install: cannot change permissions of '/home/rclinux/rc-buildroot-test/scripts/instance-2/output/target/etc/upmpdcli.conf-dist': No such file or directory
> make[4]: *** [install-dist_sysconfDATA] Error 1
> make[4]: *** Waiting for unfinished jobs....
>
> Matt, is this yet another weird thing in your autobuilder configuration?
>

That is weird, I'll take a look.

Matt
