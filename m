From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 15:01:51 +0200
Subject: [Buildroot] [RFC v4 2/3] package/qt5: bump version to 5.14.2
In-Reply-To: <20200403212357.26997-2-ps.report@gmx.net>
References: <20200403212357.26997-1-ps.report@gmx.net>
 <20200403212357.26997-2-ps.report@gmx.net>
Message-ID: <20200411150151.177625f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Apr 2020 23:23:56 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> qt5base:
>  - rebased 0002-double-conversion-enable-for-microblaze.patch
>  - rebased 0004-double-conversion-enable-for-xtensa.patch
> 
> qt5declarative:
>  - rebased 0001-qsgtexture-fix-debug-build-with-uclibc.patch
> 
> qt5enginio:
>  - add 0001-Do-not-use-deprecated-QLinkedList.patch
> 
> qt5tools:
>  - add 0001-Disable-designer-tool-fixes-configure-error.patch
>    ToDo: add proper fix/workaround
> 
> qt5webengine:
>  - update 3rdparty license hash list and chromium-latest.inc file
> 
> qt5webkit:
>  - add 0006-configure-remove-legacy-reference-to-qtConfig-mircli.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - no changes

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
