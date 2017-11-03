From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 21:56:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 1.0.2m
In-Reply-To: <20171103183359.7598-1-bernd.kuhls@t-online.de>
References: <20171103183359.7598-1-bernd.kuhls@t-online.de>
Message-ID: <20171103215632.14cdfd77@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Nov 2017 19:33:59 +0100, Bernd Kuhls wrote:
> Fixes the following CVEs:
> bn_sqrx8x_internal carry bug on x86_64 (CVE-2017-3736)
> Malformed X.509 IPAddressFamily could cause OOB read (CVE-2017-3735)
> 
> Release notes: https://www.openssl.org/news/secadv/20171102.txt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
