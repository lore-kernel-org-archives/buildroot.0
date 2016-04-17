From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Apr 2016 22:06:15 +0200
Subject: [Buildroot] [PATCH v3 3/4] board/minnowboard-max: Add more
	peripherals and features to the kernel
In-Reply-To: <1460820203-6080-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Sat, 16 Apr 2016 12:23:22 -0300")
References: <1460820203-6080-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460820203-6080-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <8760vgf1ag.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > This commit enables support for:
 >   * HDMI audio
 >   * Support for user-provided EDID firmware
 >     (useful to workaround broken monitors)
 >   * Evdev interface
 >   * System V IPC (required by ALSA)

 > The options make the system more useful.

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > --
 > Changes from v1:

 >   * Since we dropped systemd usage, got rid of related
 >     options.

Committed, thanks.

-- 
Bye, Peter Korsgaard
