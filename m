From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 18:43:19 +0200
Subject: [Buildroot] [PATCH 1/1] whois: bump to version 5.3.0
In-Reply-To: <20180520142906.13060-1-fontaine.fabrice@gmail.com>
References: <20180520142906.13060-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520184319.0b08a73b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 16:29:06 +0200, Fabrice Fontaine wrote:
> - libidn1 support has been removed:
>   https://github.com/rfc1036/whois/commit/5d60bbe102b71c03b9a46eb0a7aada3532bd4481
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/whois/whois.hash | 7 +++++--
>  package/whois/whois.mk   | 9 ++-------
>  2 files changed, 7 insertions(+), 9 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
