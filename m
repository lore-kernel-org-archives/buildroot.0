From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 23:45:25 +0200
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.18
In-Reply-To: <1405631629-22160-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405631629-22160-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140717234525.08fdb686@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 17 Jul 2014 18:13:49 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2014-4617 (The do_uncompress function in g10/compress.c
> allows context-dependent attackers to cause a denial of service
> (infinite loop) via malformed compressed packets, as demonstrated by an
> a3 01 5b ff byte sequence.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gnupg/gnupg.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
