From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Feb 2015 00:09:28 +0100
Subject: [Buildroot] [PATCH v2] madplay: fix alsa detection/linking
	using host-pkgconf
In-Reply-To: <1422915339-4306-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Mon, 2 Feb 2015 23:15:39 +0100")
References: <1422915339-4306-1-git-send-email-ps.report@gmx.net>
Message-ID: <87pp9rgbbr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1]: configure check for libasound failed because of missing
 > pthread linkage.

 > [1] http://autobuild.buildroot.net/results/f3a/f3a0b3ff15e729d223c8c8ee6af75c425cd344b6/

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - use host-pkgconf for alsa librarys (suggested by Peter Korsgaard)
 >     instead adding only single library dependencys (e.g. -lpthread)

Committed, thanks.

-- 
Bye, Peter Korsgaard
