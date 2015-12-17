From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 17:35:49 +0100
Subject: [Buildroot] [PATCH 1/2] netsniff-ng: check for geoip, ncurses,
 zlib
In-Reply-To: <1450362837-8087-1-git-send-email-joris.lijssens@gmail.com>
References: <1450362837-8087-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151217173549.4ba4fd19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joris Lijssens,

On Thu, 17 Dec 2015 15:33:56 +0100, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/netsniff-ng/netsniff-ng.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

I've applied after slightly editing the commit title: in Buildroot
speak, we generally don't talk about "checks" but rather "optional
dependencies". So a title like "netsniff-ng: add optional dependencies
on geoip, ncurses and zlib" was more appropriate.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
