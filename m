From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:50:22 +0100
Subject: [Buildroot] [PATCH] glibc: disable eglibc 2.18 for sparc
In-Reply-To: <1426630860-2813-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426630860-2813-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150320215022.7df3b2f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Mar 2015 19:21:00 -0300, Gustavo Zacarias wrote:
> It's broken as well, wants to emit v9 asm.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glibc/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied, but shouldn't we simply deprecated eglibc ? The latest eglibc
release was 2.19, and glibc has already made two releases (2.20 and
2.21) since then.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
