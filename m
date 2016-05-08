From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:33:14 +0200
Subject: [Buildroot] [PATCH] squid: security bump to version 3.5.18
In-Reply-To: <1462713268-26789-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462713268-26789-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160508153314.40a53c13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 May 2016 10:14:28 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-4553 - Cache Poisoning issue in HTTP Request handling
> CVE-2016-4554 - Header Smuggling issue in HTTP Request processing
> CVE-2016-4555 - Multiple Denial of Service issues in ESI Response
> processing (client_side_request.cc)
> CVE-2016-4556 - Multiple Denial of Service issues in ESI Response
> processing (Esi.cc)
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/squid/squid.hash | 6 +++---
>  package/squid/squid.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
