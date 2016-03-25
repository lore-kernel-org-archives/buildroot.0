From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 22:42:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/libldns: Fix build error with
	perl 5.10
In-Reply-To: <1458924359-27561-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Fri, 25 Mar 2016 17:45:59 +0100")
References: <1458924359-27561-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <8737refd41.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Add more upstream commits to fix build errors with perl 5.10
 > introduced by the previous patch to fix build errors with perl 5.22.

 > Fixes
 > http://autobuild.buildroot.net/results/325/32519c6d4084f334b7fed9edfb8a8c68a1f840a8/
 > and many others

 > Please note that switching to the upstream branch 'develop' will
 > introduce new build errors when dane support is disabled.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I'm not sure what went wrong here, but I cannot apply this patch:

checking file package/libldns/0004-doxyparse.patch
checking file package/libldns/0005-doxyparse.patch
patch: **** malformed patch at line 377:  32, ldns


-- 
Bye, Peter Korsgaard
