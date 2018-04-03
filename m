From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 15:51:30 +0200
Subject: [Buildroot] [PATCH 2/2] prosody: needs MMU
In-Reply-To: <e7d3af9b986c98c2e11b0a60789401b7e49687c6.1522730725.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 Apr 2018 07:45:25 +0300")
References: <a4acccee1aac11202402728b64d23a3f0f7128be.1522730725.git.baruch@tkos.co.il>
 <e7d3af9b986c98c2e11b0a60789401b7e49687c6.1522730725.git.baruch@tkos.co.il>
Message-ID: <87sh8cpfdp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > prosody POSIX support code calls fork() unconditionally.
 > prosody also uses the mallinfo() API, but uClibc does not provide that
 > for no-MMU targets.

 > Fixes:
 > http://autobuild.buildroot.net/results/2d0/2d0f97e41cc1d4c9c7a0eacd4eec8bad6f00bcff/
 > http://autobuild.buildroot.net/results/f69/f69dfb1a7d1163b402b1f9bef045891c229539e5/

 > Cc: Dushara Jayasinghe <nidujay@gmail.com>
 > Cc: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
