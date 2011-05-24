From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 May 2011 16:25:59 +0200
Subject: [Buildroot] [PATCH 1/1] kernel-patch.sh: script changed to
	support archives in a proper way
In-Reply-To: <4DDBBB89.2020301@atmel.com> (Nicolas Ferre's message of "Tue, 24
	May 2011 16:07:05 +0200")
References: <4D9D84AB.3080101@atmel.com>
	<1968dad8075f5f4a269aa905e5e07d1138acd7a0.1305713224.git.ludovic.desroches@atmel.com>
	<4DDBBB89.2020301@atmel.com>
Message-ID: <87pqn86uq0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Ferre <nicolas.ferre@atmel.com> writes:

 Nicolas> Le 18/05/2011 12:10, Ludovic Desroches :
 >> The previous script doesn't support patching order with archives since
 >> it didn't extract archives but simply decompressed file and piped the
 >> result to the patch command.
 >> This new script extracts archives in a temporary folder and then applies
 >> patches.

 Nicolas> Hi guys,

 Nicolas> Any comment on this patch?

Sorry, haven't looked at it yet. We're just about to release
2011.05, and then I'm leaving for 1 week of holiday. I'll take a look
once I'm back.

-- 
Bye, Peter Korsgaard
