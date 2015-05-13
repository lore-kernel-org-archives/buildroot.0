From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 22:47:58 +0200
Subject: [Buildroot] [PATCH] openldap: fix static link with openssl
In-Reply-To: <33a0cb92a9390f2851bde5dc52b48da398305c28.1431541327.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 13 May 2015 21:22:07 +0300")
References: <33a0cb92a9390f2851bde5dc52b48da398305c28.1431541327.git.baruch@tkos.co.il>
Message-ID: <87oalodx1d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Use pkg-config to get openssl link dependencies.
 > Fixes:
 > http://autobuild.buildroot.net/results/dd3/dd3821e713b7da7cde0f059409fba46371c8bc40/
 > http://autobuild.buildroot.net/results/d60/d60c8b4522e99cf385ee41aa20a1d49deb59c5fb/
 > http://autobuild.buildroot.net/results/b41/b41c043fb3b2fad1d9cea0a95b512fb4942b5b19/

 > and more.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
