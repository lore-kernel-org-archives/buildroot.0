From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Sep 2010 18:59:52 +0200
Subject: [Buildroot] [PATCH] bump kernel headers to latest stable
In-Reply-To: <1283608961-5802-1-git-send-email-Marcus.Osdoba@googlemail.com>
References: <1283608961-5802-1-git-send-email-Marcus.Osdoba@googlemail.com>
Message-ID: <20100904185952.009cdb85@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Sep 2010 16:02:41 +0200
marcus.osdoba at googlemail.com wrote:

> From: Marcus Osdoba <marcus.osdoba@googlemail.com>
> 
> Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>

Good, but you also need to adjust the
scsi-use-__uX-types-for-headers-exported-to-user-space.patch for the
different kernel versions.

Could you take care of this and resend a patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
