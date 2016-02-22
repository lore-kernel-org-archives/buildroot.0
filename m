From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Feb 2016 09:31:16 +0100
Subject: [Buildroot] [PATCH 2/2] board/firefly_rk3288: Update ARM
	variant and fix kernel repo
In-Reply-To: <1456060331-2239-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Sun, 21 Feb 2016 10:12:11 -0300")
References: <1456060331-2239-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1456060331-2239-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <87k2lx87u3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > This commit updates the two firefly_rk3288 defconfigs recently
 > added. First we switch to the ARM cortex-A17 core. Second,
 > we switch the kernel github access from SSH to HTTPS, which
 > is suitable for anonymous access.

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
