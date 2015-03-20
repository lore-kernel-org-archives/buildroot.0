From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:03:06 +0100
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.23
In-Reply-To: <1426855791-7093-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426855791-7093-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150320140306.5926cf0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 20 Mar 2015 09:49:51 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-0231 - Use After Free Vulnerability in unserialize()
> CVE-2015-2305 - heap overflow vulnerability in regcomp.c
> CVE-2015-2331 - ZIP Integer Overflow leads to writing past heap boundary
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
