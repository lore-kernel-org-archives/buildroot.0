From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:45:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/libzip: use ENABLE_BZIP2
In-Reply-To: <20200720204207.2005746-1-fontaine.fabrice@gmail.com>
References: <20200720204207.2005746-1-fontaine.fabrice@gmail.com>
Message-ID: <20200721094534.061e8d84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Jul 2020 22:42:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use ENABLE_BZIP2 option which is available since version 1.5.2 and
> https://github.com/nih-at/libzip/commit/028c492c9d45ca29e2fbec79a203ba492016f15e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libzip/libzip.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
