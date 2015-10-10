From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 19:24:13 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add option to
 enable/disable ipv6 support
In-Reply-To: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
References: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
Message-ID: <20151010192413.640a2b56@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Wetzel,

On Wed, 23 Sep 2015 15:16:34 +0200, Andreas Wetzel wrote:
> Added configuration option BR2_PACKAGE_LIBWEBSOCKETS_IPV6 that
> adds -DLWS_IPV6=ON/OFF to LIBWEBSOCKETS_CONF_OPTS.
> 
> Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>

Have you received some news from the upstream developers to explain why
an IPv6-enabled libwebsocket breaks with a non-IPv6 capable kernel?

In the mean time, I'll mark your patch as Changes Requested in our
patch tracking system, since you have received some comments. So please
make sure you repost a new version once you receive more feedback from
upstream (hopefully a patch for libwebsockets that makes it work
correctly even if the kernel doesn't have IPv6 support).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
