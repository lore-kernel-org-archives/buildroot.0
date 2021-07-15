From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 22:42:38 +0200
Subject: [Buildroot] [PATCH 1/3] package/nginx-modsecurity: drop
 unneeded select on pcre
In-Reply-To: <20210714085346.2464634-1-fontaine.fabrice@gmail.com>
References: <20210714085346.2464634-1-fontaine.fabrice@gmail.com>
Message-ID: <20210715224238.7600047d@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 14 Jul 2021 10:53:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop unneeded select on pcre which has been added by commit
> d35873ab0ce5921974239354f8c6e1b4ccc6e565
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nginx-modsecurity/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
