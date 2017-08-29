From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 23:12:11 +0200
Subject: [Buildroot] [PATCH] connman: security bump to version 1.35
In-Reply-To: <90e8969c73a1c0e21f3c2f060d590de9172853c1.1503944211.git.baruch@tkos.co.il>
References: <90e8969c73a1c0e21f3c2f060d590de9172853c1.1503944211.git.baruch@tkos.co.il>
Message-ID: <20170829231211.716e5591@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Aug 2017 21:16:51 +0300, Baruch Siach wrote:
> Fixes CVE-2017-12865: stack overflow in dns proxy feature.
> 
> Cc: Martin Bark <martin@barkynet.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/connman/connman.hash | 2 +-
>  package/connman/connman.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. I have to say I was a bit surprised to not
see this CVE mentioned on the Connman page about the 1.35 release. But
indeed, Debian says it has been fixed in 1.35, and there is a fix for a
crash in dnsproxy.c, which matches the CVE.

Upstream could be a little bit clearer though. Or maybe the CVE was
filled after 1.35 was released ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
