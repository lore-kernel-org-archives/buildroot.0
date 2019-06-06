From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 23:52:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/nanomsg: fix legal-info failure
In-Reply-To: <1559852666-19259-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Thu, 6 Jun 2019 22:24:26 +0200")
References: <1559852666-19259-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <87zhmucrga.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > After version bump, the sha256 has been updated
 > while the COPYING file remains unchanged.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/ec1cb0216ebedc5c7bd2c8719460db28b666a24f/

 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
 > ---
 > Now make legal-info is OK: 
 -> COPYING: OK (sha256: 4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a)

Committed, thanks.

-- 
Bye, Peter Korsgaard
