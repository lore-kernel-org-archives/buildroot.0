From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:23:19 +0100
Subject: [Buildroot] [PATCH 1/3] package/mutt: fix activation of openssl
 on imap
In-Reply-To: <20201223105950.2278971-1-fontaine.fabrice@gmail.com>
References: <20201223105950.2278971-1-fontaine.fabrice@gmail.com>
Message-ID: <20201226182319.3413b005@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Dec 2020 11:59:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Activation of openssl for imap is broken since commit
> 0fcd010a2db771c259224ad1d025fb4c5a9baf3b because of the following typo:
> BR2_PACKAGET_MUTT_IMAP
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mutt/mutt.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
