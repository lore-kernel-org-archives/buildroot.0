From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:27:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/leptonica: add libwebp{demux,
 mux} optional dependency
In-Reply-To: <20210131194125.4031759-1-fontaine.fabrice@gmail.com>
References: <20210131194125.4031759-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131212718.4cfdd177@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Jan 2021 20:41:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> leptonica optionally depends on webp/demux.h and webp/mux.h since
> version 1.79.0:
> https://github.com/DanBloomberg/leptonica/commit/a7c5bcdf04062aad3655642bdb853561a1c49733
> https://github.com/DanBloomberg/leptonica/commit/0ce4b9cc0845b198583d51f0a0df277de8f8c5fa
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1f8531e1651e82a1e93707ccb205d0e7a3cae1a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/leptonica/leptonica.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
