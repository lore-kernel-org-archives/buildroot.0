From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Apr 2012 20:42:07 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix build breakage
In-Reply-To: <1335787918-22584-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 30 Apr 2012 09:11:58 -0300")
References: <1335787918-22584-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87obq92ha8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix uboot-tools build breakage as reported by Peter Korsgaard.
 Gustavo> Previously config.h was included in imximage.h but not the
 Gustavo> fw_env tool.

Committed, thanks.

-- 
Bye, Peter Korsgaard
