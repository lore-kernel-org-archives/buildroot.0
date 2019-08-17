From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 00:19:33 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libevent: drop patch
In-Reply-To: <20190817193208.28338-1-fontaine.fabrice@gmail.com>
References: <20190817193208.28338-1-fontaine.fabrice@gmail.com>
Message-ID: <20190818001933.78623078@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 17 Aug 2019 21:32:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch and autoreconf, instead use existing
> --disable-libevent-regress option to disable tests
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Disable-building-test-programs.patch | 31 -------------------
>  package/libevent/libevent.mk                  | 11 ++++---
>  2 files changed, 7 insertions(+), 35 deletions(-)
>  delete mode 100644 package/libevent/0001-Disable-building-test-programs.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
