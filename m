From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 22:59:15 +0200
Subject: [Buildroot] [PATCH] stunnel: security bump to version 5.35
In-Reply-To: <1469289812-15705-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469289812-15705-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160723225915.7e4fb890@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 13:03:32 -0300, Gustavo Zacarias wrote:
> Fixes:
> TLS session caching memory leak
> Malfunctioning "verify = 4"
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/stunnel/stunnel.hash | 4 ++--
>  package/stunnel/stunnel.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
