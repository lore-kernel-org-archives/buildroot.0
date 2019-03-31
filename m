From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 13:56:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/omxplayer: bump to version
 f06235cc9690a6d58187514452df8cf8fcdaacec
In-Reply-To: <20190330174833.19097-1-fontaine.fabrice@gmail.com>
References: <20190330174833.19097-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331135603.20f721cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Mar 2019 18:48:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix build with ffmpeg 4.x
> - Update hash of license file, GPL mailing address was fixed:
>   https://github.com/popcornmix/omxplayer/commit/5da1379efc32878b6151110aef73f91b6c433cdb
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e413c9b2ad7b97f0552f2477293ca5fe861df06c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/omxplayer/omxplayer.hash | 6 +++---
>  package/omxplayer/omxplayer.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
