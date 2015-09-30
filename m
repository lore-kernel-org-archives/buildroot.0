From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 13:49:30 +0200
Subject: [Buildroot] [PATCH 1/2] ltp-testsuite: don't include host
	headers
In-Reply-To: <5e7ab0a7bf987fa76a167569b823df89144af045.1443613129.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 30 Sep 2015 14:38:48 +0300")
References: <5e7ab0a7bf987fa76a167569b823df89144af045.1443613129.git.baruch@tkos.co.il>
Message-ID: <87612sxh2t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > $SYSROOT defaults to empty, so we must set it to our sysroot.
 > Fixes:
 > http://autobuild.buildroot.net/results/812/812986b00786972d4e7fbb0362460a0de8a70472/
 > http://autobuild.buildroot.net/results/4a3/4a3c7ea4eb08248f2aec45d8efc111087bc1327f/
 > http://autobuild.buildroot.net/results/8b6/8b6f7adb5546387c25f3a4c9d8e6f72f4b62b9a4/

 > and more.

 > Cc: Anders Roxell <anders.roxell@linaro.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
