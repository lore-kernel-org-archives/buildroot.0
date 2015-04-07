From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 21:35:36 +0200
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p2
In-Reply-To: <1428425651-24304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428425651-24304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150407213536.514653fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  7 Apr 2015 13:54:11 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-1798 - ntpd accepts unauthenticated packets with symmetric key
> crypto.
> CVE-2015-1799 -  Authentication doesn't protect symmetric associations
> against DoS attacks.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ntp/ntp.hash | 4 ++--
>  package/ntp/ntp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
