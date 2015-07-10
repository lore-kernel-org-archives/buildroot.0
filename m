From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 01:00:37 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 5.6.11
In-Reply-To: <1436527324-25864-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436527324-25864-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150711010037.30f9d087@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 10 Jul 2015 08:22:04 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-3152 - mysqlnd is vulnerable to BACKRONYM
> 
> And other security bugs with no CVE assigned yet:
> Bug #69972 - Use-after-free vulnerability in
> sqlite3SafetyCheckSickOrOk()
> Bug # 69970 - Use-after-free vulnerability in
> spl_recursive_it_move_forward_ex()
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
