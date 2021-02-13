From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Feb 2021 00:16:15 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/mpd: fix build of GenParseName
In-Reply-To: <20210201074101.457193-1-fontaine.fabrice@gmail.com>
References: <20210201074101.457193-1-fontaine.fabrice@gmail.com>
Message-ID: <20210214001615.407dd6a1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  1 Feb 2021 08:41:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of GenParseName which has been added in version 0.22:
> https://github.com/MusicPlayerDaemon/MPD/commit/fa45a8adfa44f6bc815ae7428770112c15c76d73
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/871e1362c44e5b68a149e6a5dd3caf99ea0d904a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Use link_language instead of linking with -lstdc++

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
