From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:37:04 +0200
Subject: [Buildroot] [PATCH 0/3] sstrip: drop host variant and deprecate
 target variant
In-Reply-To: <1466088075-7635-1-git-send-email-julien.floret@6wind.com>
References: <1466088075-7635-1-git-send-email-julien.floret@6wind.com>
Message-ID: <20160618153704.674599d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 16:41:12 +0200, Julien Floret wrote:
> Host sstrip is not used anymore.
> What's more, sstrip is not maintained and potentially harmful.
> 
> Julien Floret (3):
>   sstrip: get rid of host variant
>   Config.in: Add BR2_DEPRECATED_SINCE_2016_08
>   sstrip: mark as deprecated

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
