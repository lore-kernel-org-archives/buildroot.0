From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Jun 2019 12:00:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/libevent: bump to version 2.1.10
In-Reply-To: <1559928848-27814-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Fri, 7 Jun 2019 19:34:08 +0200")
References: <1559928848-27814-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <875zpgcs6z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > See: https://github.com/libevent/libevent/releases/tag/release-2.1.10-stable
 > Also fix check-package warning.

 > Fixes:

 > $. ./utils/check-package package/libevent/* -v
 > package/libevent/0001-Disable-building-test-programs.patch:4: generate your patches with 'git format-patch -N'
 > Subject: [PATCH 1/2] Disable building test programs
 > 76 lines processed
 > 1 warnings generated

 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Committed, thanks.

-- 
Bye, Peter Korsgaard
