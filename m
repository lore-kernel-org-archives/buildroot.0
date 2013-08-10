From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 21:26:42 +0200
Subject: [Buildroot] [PATCH 1/3] busybox: set/unset CONFIG_NOMMU
In-Reply-To: <1376076221-28066-1-git-send-email-gustavo@zacarias.com.ar>
References: <1376076221-28066-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130810212642.342983bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  9 Aug 2013 16:23:39 -0300, Gustavo Zacarias wrote:
> Set busybox .config CONFIG_NOMMU appropiately and streamline this new
> setting with the previous BUSYBOX_DISABLE_MMU_APPLETS in a single
> BUSYBOX_SET_MMU definition (since it's not just applets now).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed your three !MMU patches, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
