From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 21:44:58 +0200
Subject: [Buildroot] [PATCH] board/atmel: use correct sam-ba binary in
 flasher.sh script
In-Reply-To: <1522964081-1235-1-git-send-email-joshua.henderson@microchip.com>
 (Joshua Henderson's message of "Thu, 5 Apr 2018 14:34:41 -0700")
References: <1522964081-1235-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <87y3hx8oud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joshua" == Joshua Henderson <joshua.henderson@microchip.com> writes:

 > Instead of using the install of sam-ba under host/opt directly, use the symlink
 > created in host/bin.  The side effect of doing this instead allows the correct
 > sam-ba binary to be used based on the host arch being 32 bit or 64 bit.

 > Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
