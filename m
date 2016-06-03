From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:46:41 +0200
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p8
In-Reply-To: <1464917182-22090-1-git-send-email-gustavo@zacarias.com.ar>
References: <1464917182-22090-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160603094641.34a1c213@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Jun 2016 22:26:22 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-4957 - Crypto-NAK crash
> CVE-2016-4953 - Bad authentication demobilizes ephemeral associations
> CVE-2016-4954 - Processing spoofed server packets
> CVE-2016-4955 - Autokey association reset
> CVE-2016-4956 - Broadcast interleave
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ntp/ntp.hash | 6 +++---
>  package/ntp/ntp.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
