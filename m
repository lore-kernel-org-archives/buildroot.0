From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 22:57:57 +0200
Subject: [Buildroot] [PATCH 1/3] libgpgme: fix run-time compatibility
 with gnupg2 2.2.6
In-Reply-To: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
References: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
Message-ID: <20180425225757.10e33054@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 12:37:11 +0300, Baruch Siach wrote:
> Add upstream patch fixing gpgme_op_verify regression with gnupg2 2.2.6.
> 
> https://lists.gnupg.org/pipermail/gnupg-users/2018-April/060230.html
> 
> Cc: Philipp Claves <claves@budelmann-elektronik.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...1-core-Tweak-STATUS_FAILURE-handling.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
