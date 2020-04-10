From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 23:00:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtdev: bump to version 1.1.6
In-Reply-To: <20200410202621.650851-1-fontaine.fabrice@gmail.com>
References: <20200410202621.650851-1-fontaine.fabrice@gmail.com>
Message-ID: <20200410230011.228eb6e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 22:26:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update indentation of hash file (two spaces)
> - This bump will fix build with musl 1.2.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5861dc032ba2d0e092f742674759b39f393a710d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mtdev/mtdev.hash | 4 ++--
>  package/mtdev/mtdev.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
