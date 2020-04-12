From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 22:49:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/ogre: fix build with RELRO
In-Reply-To: <20200210174511.719351-1-fontaine.fabrice@gmail.com>
References: <20200210174511.719351-1-fontaine.fabrice@gmail.com>
Message-ID: <20200412224911.65d47f8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Feb 2020 18:45:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b64dfcd8e576666e8a4a52da81a2f5a92b779dc7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ompiledHeader.cmake-Add-c-argument-t.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch

Applied to master, thanks. Your patch has been merged upstream, on
February 10, and upstream has released a new version 1.12.5 on February
16. There are some chances that bumping to 1.12.5 would allow to drop
this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
