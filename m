From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:44:32 +0200
Subject: [Buildroot] [PATCH] libpcap: handle bluetooth explicitly
In-Reply-To: <1407116329-24924-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407116329-24924-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140804094432.2862fb21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun,  3 Aug 2014 22:38:49 -0300, Gustavo Zacarias wrote:
> If bluez_utils is around then add it to dependencies so as to use it,
> but if it's not (for instance bluez5_utils is around) then disable it
> since the bluez5 API isn't compatible. Fixes:
> http://autobuild.buildroot.net/results/6ca/6caeb7f41ac5e14dbee49f87511af3351f6013f1/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libpcap/libpcap.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
