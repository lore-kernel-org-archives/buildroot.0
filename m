From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:06:49 +0100
Subject: [Buildroot] [PATCH] squid: security bump to version 3.5.15
In-Reply-To: <1456317803-2254-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456317803-2254-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160229230649.42b03ced@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Wed, 24 Feb 2016 09:43:23 -0300, Gustavo Zacarias wrote:
> Fixes:
> SQUID-2016:2 - Multiple Denial of Service issues in HTTP Response
> processing.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/squid/squid.hash | 6 +++---
>  package/squid/squid.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks. The 3.5.15 is now visible on squid website,
and indicated as fixing several CVEs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
