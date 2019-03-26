From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 12:57:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: fix shared build
In-Reply-To: <20190325210508.8125-1-fontaine.fabrice@gmail.com>
References: <20190325210508.8125-1-fontaine.fabrice@gmail.com>
Message-ID: <20190326125701.4815746d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Mar 2019 22:05:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update second patch to fix shared build
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c27b9c82e68ade29b45dc84ecce5fe6653fbb7da
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-configure.ac-use-pkg-config-to-find-openssl.patch      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
