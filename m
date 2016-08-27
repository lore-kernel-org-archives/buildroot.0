From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:48:23 +0200
Subject: [Buildroot] [PATCH] package/lshw: add patches for musl build
In-Reply-To: <20160826232940.23592-1-arnout@mind.be>
References: <20160826232940.23592-1-arnout@mind.be>
Message-ID: <20160827144823.1eff83b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Aug 2016 01:29:40 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Fixing one issue exposed a second one.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...02-Fix-musl-build-basename-is-in-libgen.h.patch | 78 ++++++++++++++++++++++
>  package/lshw/0003-Fix-use-of-LONG_BIT.patch        | 36 ++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch
>  create mode 100644 package/lshw/0003-Fix-use-of-LONG_BIT.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
