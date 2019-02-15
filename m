From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:31:40 +0100
Subject: [Buildroot] [PATCH/next 2/2] package/libcpprestsdk: disable
 samples
In-Reply-To: <20190212224547.19315-2-fontaine.fabrice@gmail.com>
References: <20190212224547.19315-1-fontaine.fabrice@gmail.com>
 <20190212224547.19315-2-fontaine.fabrice@gmail.com>
Message-ID: <20190215223140.3b2a9a58@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue, 12 Feb 2019 23:45:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcpprestsdk/libcpprestsdk.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Explicitly disabling the build of examples definitely makes sense to
have in master, so I've applied this patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
