From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 10:16:08 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: fix procps-ng library
 name
In-Reply-To: <1429269780-107634-1-git-send-email-kaszak@gmail.com>
References: <1429269780-107634-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150419101608.5b404d58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Fri, 17 Apr 2015 13:23:00 +0200, Karoly Kasza wrote:
> procps-ng libraries are now accesible on the same name as procps, thus
> using the CUSTOM_PROCPS_NAME environment variable breaks compilation.
> 
> This fixes autobuild error 2a19f84c35de0ff008c2cd1aea96f6a4f2767ee1.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/openvmtools/openvmtools.mk |    1 -
>  1 file changed, 1 deletion(-)

Applied after fixing the autobuilder reference, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
