From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:03:17 +0200
Subject: [Buildroot] [PATCH] libostree: exclude 'lib' from libsoup
 configure option
In-Reply-To: <20180629081300.30216-1-marcus.folkesson@gmail.com> (Marcus
 Folkesson's message of "Fri, 29 Jun 2018 10:13:00 +0200")
References: <20180629081300.30216-1-marcus.folkesson@gmail.com>
Message-ID: <87y3e7ee56.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Folkesson <marcus.folkesson@gmail.com> writes:

 > The option used by configure script is actually
 > --with-soup/--without-soup.

 > Fixes:
 > - http://autobuild.buildroot.net/results/cf8ab76b8ea1a555d42f0625df1d58543e88efb1/

 > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
