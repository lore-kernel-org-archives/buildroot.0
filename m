From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:38:01 +0100
Subject: [Buildroot] [PATCH 1/2] package/ulogd: use --without-mysql
In-Reply-To: <20190314212059.20817-1-fontaine.fabrice@gmail.com>
References: <20190314212059.20817-1-fontaine.fabrice@gmail.com>
Message-ID: <20190314223801.47ce54c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Mar 2019 22:20:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace --with-mysql=no by --without-mysql
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ulogd/ulogd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks! They could have been a single patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
