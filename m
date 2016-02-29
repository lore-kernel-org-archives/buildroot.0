From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:44:51 +0100
Subject: [Buildroot] [PATCH] xerces: security bump to version 3.1.3
In-Reply-To: <1456759630-7527-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456759630-7527-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160229214451.6fd090d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 29 Feb 2016 12:27:10 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-0729 - Apache Xerces-C XML Parser Crashes on Malformed Input
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/xerces/xerces.hash | 4 ++--
>  package/xerces/xerces.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
