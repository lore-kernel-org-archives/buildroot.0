From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:19:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/uacme: fix build with mbedtls
 and gnutls
In-Reply-To: <20191003164948.17496-1-fontaine.fabrice@gmail.com>
References: <20191003164948.17496-1-fontaine.fabrice@gmail.com>
Message-ID: <20191005231942.152758b4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Oct 2019 18:49:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mbedtls and gnutls can't be enabled at the same time so prefer gnutls
> to keep the same default behavior than the configure file
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a016b58d755cc0888680b345844f92de467329b2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/uacme/uacme.mk | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
