From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:27:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiredis: fix build without C++
In-Reply-To: <20200905105913.50960-1-fontaine.fabrice@gmail.com>
References: <20200905105913.50960-1-fontaine.fabrice@gmail.com>
Message-ID: <20200905232756.3f6b98fe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Sep 2020 12:59:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This patch is needed to fix a build failure with hiredis 1.0.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/830ec3398cd29b9fc5cde06a225ef531d7a9d850
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-allow-building-without-a-C-compiler.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
