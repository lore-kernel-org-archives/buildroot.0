From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:14:59 +0100
Subject: [Buildroot] [PATCH] jasper: bump to version 2.0.10
In-Reply-To: <fb303a78ecb0aa757a78bc896b2c3627093528d3.1484254064.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 12 Jan 2017 22:47:44 +0200")
References: <fb303a78ecb0aa757a78bc896b2c3627093528d3.1484254064.git.baruch@tkos.co.il>
Message-ID: <87vatjat58.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Use upstream provided tarball.
 > Upstream switched to cmake.

 > libjpeg dependency is now optional.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

Did you verify that none of the reverse dependencies need the jpeg
support?

-- 
Bye, Peter Korsgaard
