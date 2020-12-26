From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:21:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/bustle: bump to version 0.8.0
In-Reply-To: <20201223113354.2295201-1-fontaine.fabrice@gmail.com>
References: <20201223113354.2295201-1-fontaine.fabrice@gmail.com>
Message-ID: <20201226182145.7a8c622e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Dec 2020 12:33:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update license hash and remove GPL-3.0:
>   https://gitlab.freedesktop.org/bustle/bustle/-/commit/c3f2f160c528c874c483a314ebbf997abfd85492
> - Use PCAP_CONFIG which is available since
>   https://gitlab.freedesktop.org/bustle/bustle/-/commit/7e2daf2984fc4d479b153e899b80e8d669ff54cf
> - Update indentation in hash file (two spaces)
> 
> https://hackage.haskell.org/package/bustle-0.8.0/changelog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bustle/bustle.hash |  4 ++--
>  package/bustle/bustle.mk   | 14 +++++---------
>  2 files changed, 7 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
