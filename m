From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 21:54:22 +0100
Subject: [Buildroot] [PATCH 1/1] haproxy: bump to version 1.9.1
In-Reply-To: <20190113140412.24927-1-fontaine.fabrice@gmail.com>
References: <20190113140412.24927-1-fontaine.fabrice@gmail.com>
Message-ID: <20190113215422.4b46796b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jan 2019 15:04:12 +0100, Fabrice Fontaine wrote:
> Remove patch and tweak haproxy.mk to adapt pcre-config/pcre2-config
> workaround with upstream solution
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-Allow-configuration-of-pcre-config-path.patch | 56 ----------------------
>  package/haproxy/haproxy.hash                       |  2 +-
>  package/haproxy/haproxy.mk                         |  8 ++--
>  3 files changed, 5 insertions(+), 61 deletions(-)
>  delete mode 100644 package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
