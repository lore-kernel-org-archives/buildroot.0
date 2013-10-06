From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 20:55:40 +0200
Subject: [Buildroot] [PATCHv2 03/21] toolchain-external: make
	ext-tool.mk includable in all cases
In-Reply-To: <1381069171-29748-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Oct 2013 16:19:13 +0200")
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381069171-29748-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvsedyab.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The ext-tool.mk logic uses the TOOLCHAIN_EXTERNAL_PREFIX variable
 Thomas> unconditionally, even if the external toolchain is not used. Until now
 Thomas> this wasn't a problem since ext-tool.mk was only included when the
 Thomas> external toolchain backend was selected, but the next patches are
 Thomas> going to include this file unconditionally.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
