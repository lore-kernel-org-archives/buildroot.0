From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:38:03 +0100
Subject: [Buildroot] [PATCH 1/1] docs/manual: replace
 LIBFOO_CPE_ID_PRODUCT
In-Reply-To: <20210111201225.1414497-1-fontaine.fabrice@gmail.com>
References: <20210111201225.1414497-1-fontaine.fabrice@gmail.com>
Message-ID: <20210111213803.2940f1c9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 21:12:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace LIBFOO_CPE_ID_PRODUCT by LIBFOO_CPE_ID_NAME
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  docs/manual/adding-packages-generic.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks. In retrospect, we should have probably
called this CPE_ID_PRODUCT. But oh well, there are so many CPE_ID_NAME
now, I'm not sure it's worth changing anymore.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
