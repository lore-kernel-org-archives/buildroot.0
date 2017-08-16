From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:19:07 +0200
Subject: [Buildroot] [PATCH] faad2: fix build with musl libc
In-Reply-To: <b727a178e0fa5a10b77e298e7b1dbf1b32ccb40d.1502880785.git.baruch@tkos.co.il>
References: <b727a178e0fa5a10b77e298e7b1dbf1b32ccb40d.1502880785.git.baruch@tkos.co.il>
Message-ID: <20170816231907.16e5776a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Aug 2017 13:53:05 +0300, Baruch Siach wrote:
> The getopt.c code declares the strncmp() routine in a non confirming way
> under non GNU libc. Patch the code to make the declaration standard
> conforming.
> 
> Fixes:
> http://autobuild.buildroot.net/results/447/4471be349d7ad2e998a4d55afd33aa046a5d1fd2/
> http://autobuild.buildroot.net/results/2a9/2a90f4f518884fb50f7ad6ab505dee7565ed869e/
> http://autobuild.buildroot.net/results/6b1/6b159b766d791492bab4d897c33ce07845fb7119/
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-getopt-fix-strncmp-declaration.patch      | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/faad2/0001-getopt-fix-strncmp-declaration.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
