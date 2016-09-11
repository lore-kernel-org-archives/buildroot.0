From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:36:27 +0200
Subject: [Buildroot] [PATCH 1/2] linux-firmware: add bluetooth firmware
 for intel chips
In-Reply-To: <1473508305-8603-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473508305-8603-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160911153627.2f6e8a06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Sep 2016 08:51:44 -0300, Gustavo Zacarias wrote:
> It probably makes no sense to try split them up by model since there
> aren't that big.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/linux-firmware/Config.in         | 10 ++++++++++
>  package/linux-firmware/linux-firmware.mk |  6 ++++++
>  2 files changed, 16 insertions(+)

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
