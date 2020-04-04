From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 23:40:49 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/vlc: fix build with opencv3
In-Reply-To: <20200308222246.1392316-1-fontaine.fabrice@gmail.com>
References: <20200308222246.1392316-1-fontaine.fabrice@gmail.com>
Message-ID: <20200404234049.0e67da8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 23:22:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/210424bd33f660aa0757f62a558e1e03faf0f371
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update patch so it does not break the build with OpenCV 2.x

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
