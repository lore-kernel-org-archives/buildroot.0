From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 00:09:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/git: security bump to version
	2.13.5
In-Reply-To: <20170811171728.30489-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 11 Aug 2017 19:17:28 +0200")
References: <20170811171728.30489-1-bernd.kuhls@t-online.de>
Message-ID: <874lsgkdal.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes CVE-2017-1000117:
 > http://www.mail-archive.com/linux-kernel at vger.kernel.org/msg1466490.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > Since bumping to 2.14.1 would be a feature patch we stick to 2.13.x in
 > the master branch and bump to 2.14.1 on the next branch.

FYI, I've bumped git to 2.12.4 for 2017.02.x instead of cherry picking
this patch.

-- 
Bye, Peter Korsgaard
