From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 12:56:50 +0100
Subject: [Buildroot] [PATCH] ruby: security bump to version 2.2.4
In-Reply-To: <1450349938-14184-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450349938-14184-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151217125650.606b7e4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 17 Dec 2015 07:58:58 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-7551 - Unsafe tainted string usage in Fiddle and DL
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ruby/ruby.hash | 4 ++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
