From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 19:50:52 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.16
In-Reply-To: <1408715343-7706-1-git-send-email-gustavo@zacarias.com.ar>
References: <1408715343-7706-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140825195052.671292bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 22 Aug 2014 10:49:03 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2014-3538 - Extensive backtracking in rule regular expression
> CVE-2014-3587 - Segfault in cdf.c
> CVE-2014-2497 - php-gd 'c_color' NULL pointer dereference
> CVE-2014-5120 - Null byte injection possible with imagexxx functions
> CVE-2014-3597 - segfault in dns_get_record
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php/php.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to the master branch, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
