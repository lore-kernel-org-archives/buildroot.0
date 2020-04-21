From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:30:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix dependency of
 network-gcrypt
In-Reply-To: <20200421171220.4120564-1-fontaine.fabrice@gmail.com>
References: <20200421171220.4120564-1-fontaine.fabrice@gmail.com>
Message-ID: <20200421223054.76bcfdf1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 19:12:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit c8b8744a1aeebeba4035fdba9556226696ac2abd forgot to propagate
> libgcrypt reverse dependency
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/98c7734dccb4e01c02f4680cfbdf82ee59e17935
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
