From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 17:46:43 +0100
Subject: [Buildroot] [PATCH] gnutls: security bump to version 3.5.10
In-Reply-To: <20170306145506.4673-1-gustavo@zacarias.com.ar>
References: <20170306145506.4673-1-gustavo@zacarias.com.ar>
Message-ID: <20170306174643.33835439@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 11:55:06 -0300, Gustavo Zacarias wrote:
> Fixes:
> GNUTLS-SA-2017-3A - Addressed integer overflow resulting to invalid
> memory write in OpenPGP certificate parsing.
> GNUTLS-SA-2017-3B - Addressed crashes in OpenPGP certificate parsing,
> related to private key parser. No longer allow OpenPGP certificates
> (public keys) to contain private key sub-packets.
> GNUTLS-SA-2017-3C - Addressed large allocation in OpenPGP certificate
> parsing, that could lead in out-of-memory condition.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gnutls/gnutls.hash | 2 +-
>  package/gnutls/gnutls.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. Peter: we want this one for LTS I guess.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
