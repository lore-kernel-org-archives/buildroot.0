From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 09:36:14 +0100
Subject: [Buildroot] [PATCH] xfsprogs: add cross-compile fix patch
In-Reply-To: <1450223935-19936-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450223935-19936-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151216093614.1f3f49a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Dec 2015 20:58:55 -0300, Gustavo Zacarias wrote:
> Don't use CFLAGS (target) with BUILD_CC (host), fixes:
> http://autobuild.buildroot.net/results/c94/c945bdb1427b55e03901027fa674b577e45963a1/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...3-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
