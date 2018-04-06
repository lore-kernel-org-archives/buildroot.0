From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Apr 2018 18:58:26 +0200
Subject: [Buildroot] [PATCH] eudev: prevent udev init script nonexistent
 directory error
In-Reply-To: <1521735601-29879-1-git-send-email-joshua.henderson@microchip.com>
 (Joshua Henderson's message of "Thu, 22 Mar 2018 09:20:01 -0700")
References: <1521735601-29879-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <87lge0gtl9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joshua" == Joshua Henderson <joshua.henderson@microchip.com> writes:

 > The following error occures in the udev init script because the kernel config
 > may optionally not include uevent_helper.

 > /etc/init.d/S10udev: line 47: can't create /proc/sys/kernel/hotplug: nonexistent directory

 > Work around this by not trying to access the destination if it's not available.

 > Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
