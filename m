From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Jul 2011 23:26:56 +0200
Subject: [Buildroot] [PATCH] sh: Fix Buildroot sh targets to match
	gnuconfig targets
In-Reply-To: <1304946773-5734-1-git-send-email-phil.edworthy@renesas.com>
 (Phil Edworthy's message of "Mon, 09 May 2011 14:12:53 +0100")
References: <1304946773-5734-1-git-send-email-phil.edworthy@renesas.com>
Message-ID: <87sjq346vz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Edworthy <PHIL.EDWORTHY@renesas.com> writes:

 Phil> sh2eb and sh2a_nofpueb gnuconfig targets are no longer supported
 Phil> in Buildroot. This patch replaces these Buildroot targets with sh2
 Phil> and sh2a respectively, and adds sh4a targets as these are widely
 Phil> used.

 Phil> To build for devices without an fpu, the relevant toolchain flags
 Phil> will have to be specified.

 Phil> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Committed, sorry for the slow response.

-- 
Bye, Peter Korsgaard
