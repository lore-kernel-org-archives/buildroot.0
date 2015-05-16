From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 17:26:43 +0200
Subject: [Buildroot] [PATCHv2] postgresql: mark as not available for
	static linking
In-Reply-To: <1431785564-7475-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 May 2015 16:12:44 +0200")
References: <1431785564-7475-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fv6wa6h8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > postgresql currently does not build in BR2_STATIC_LIBS=y
 > configurations, and since there is little interest in using such a big
 > piece of software in statically linked configuration, this commit
 > makes postgresql depends on !BR2_STATIC_LIBS.

 > Fixes:

 >   http://autobuild.buildroot.net/results/f9ed96d22e91cdba9ad92c4d4ea52e422bf1f1c9/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
