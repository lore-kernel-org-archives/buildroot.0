From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 11:28:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez-alsa: update gcc 10 patch
In-Reply-To: <20200816084523.475742-1-fontaine.fabrice@gmail.com>
References: <20200816084523.475742-1-fontaine.fabrice@gmail.com>
Message-ID: <20200816112844.7b6f227f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Aug 2020 10:45:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update patch by adding the missing update on src/ofono-iface.h from
> https://github.com/Arkq/bluez-alsa/commit/30a23dd7ce9b00c702fa48545f6b03038f9e17c6
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9200bdab254e24ecacd345c00216a3d87c014dfc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-fix-build-issue-with-gcc-10.patch    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
