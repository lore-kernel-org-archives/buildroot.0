From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 10:59:50 +0200
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p3
In-Reply-To: <1435747635-26844-1-git-send-email-gustavo@zacarias.com.ar>
References: <1435747635-26844-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150702105950.0a81c68b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  1 Jul 2015 07:47:15 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-5146 - ntpd control message crash: Crafted NUL-byte in
> configuration directive.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ntp/ntp.hash | 6 ++++--
>  package/ntp/ntp.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
