From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:16:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: fix static build
 with openssl and atomic
In-Reply-To: <20190413150005.29486-1-fontaine.fabrice@gmail.com>
References: <20190413150005.29486-1-fontaine.fabrice@gmail.com>
Message-ID: <20190413211605.24959e14@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Apr 2019 17:00:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use pkg-config to find openssl dependencies such as lz or latomic
> 
> Fixes: static build on sparc v8 (even if there are no autobuilder
> failures yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sqlcipher/sqlcipher.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
