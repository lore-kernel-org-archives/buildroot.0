From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:51:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump to 3.6.13
In-Reply-To: <20200407073644.2561937-1-stefan.sorensen@spectralink.com>
References: <20200407073644.2561937-1-stefan.sorensen@spectralink.com>
Message-ID: <20200408225155.40e78255@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Apr 2020 09:36:44 +0200
Stefan S?rensen <stefan.sorensen@spectralink.com> wrote:

> Fixes the following security issue:
> 
>  * CVE-2020-11501: It was found that GnuTLS 3.6.3 introduced a
>    regression in the DTLS protocol implementation. This caused the DTLS
>    client to not contribute any randomness to the DTLS negotiation
>    breaking the security guarantees of the DTLS protocol.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/gnutls/gnutls.hash | 4 ++--
>  package/gnutls/gnutls.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Your patch didn't apply cleanly for some reason, perhaps your SMTP
server screws it up when adding the confidentiality footer or something
like that. I fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
