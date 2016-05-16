From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2016 22:08:04 +0200
Subject: [Buildroot] [PATCH] libinput: fix missing static_assert
In-Reply-To: <a6598fc63aae9386451821fd854bfef032073a35.1463422790.git.baruch@tkos.co.il>
References: <a6598fc63aae9386451821fd854bfef032073a35.1463422790.git.baruch@tkos.co.il>
Message-ID: <20160516220804.105a6bf1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 May 2016 21:19:50 +0300, Baruch Siach wrote:
> uClibc-ng does not define the C11 static_assert macro. Patch configure.ac to
> detect this and define a nop macro.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3eb/3eb32c19f90a5fd8d45a0c36676e015e8278a469/
> http://autobuild.buildroot.net/results/184/1844890c65615f1676a85c6fac78937249eee9f1/
> http://autobuild.buildroot.net/results/3a3/3a3f8c5624e8019a6eababbf6e7440fdd668f85f/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-Add-configure.ac-check-for-static_assert.patch | 34 ++++++++++++++++++++++
>  package/libinput/libinput.mk                       |  2 ++
>  2 files changed, 36 insertions(+)
>  create mode 100644 package/libinput/0002-Add-configure.ac-check-for-static_assert.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
