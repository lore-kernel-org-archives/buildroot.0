From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 18:00:37 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/beecrypt: Fix build with
 BR2_ENABLE_DEBUG=yes, no need for expert mode anymore
In-Reply-To: <1413737269-24583-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413737269-24583-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141022180037.01930eac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 18:47:49 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d32/d326799e9b1a959778be66e36ee78e6891a7b068/
> http://autobuild.buildroot.net/results/b35/b353696a01ae85ad0b0c379364aaa9224e0bde42/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: - backport the complete Gentoo patch to respect buildroot-provided CFLAGS
>     - disable expert mode, not needed anymore

Applied, thanks.

What do you think can be done in terms of upstreaming? The beecrypt
project doesn't seem to be very active unfortunately. It's only used by
rpm (which could use a bump to a more recent version, but more recent
versions still use beecrypt it seems).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
