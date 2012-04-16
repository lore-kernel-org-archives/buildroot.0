From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Apr 2012 23:19:35 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: patch pattern was
	expanded prematurely
In-Reply-To: <1334592173-12495-1-git-send-email-ludovic.desroches@atmel.com>
 (ludovic desroches's message of "Mon, 16 Apr 2012 18:02:53 +0200")
References: <4F8C4224.6040500@atmel.com>
 <1334592173-12495-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <87r4vn8jdk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ludovic" == ludovic desroches <ludovic.desroches@atmel.com> writes:

 ludovic> From: Ludovic Desroches <ludovic.desroches@atmel.com> The
 ludovic> patch pattern was expanded before being into the patch
 ludovic> directory so the expansion add incorrect files.

Committed, thanks.

-- 
Bye, Peter Korsgaard
