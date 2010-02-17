From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Feb 2010 11:07:08 +0100
Subject: [Buildroot] [PATCH 3/3] at: fix compile breakage when flex
	isn't on the target
In-Reply-To: <93df31e4047f0c5708605570de65bcd1d777c01d.1265759162.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 10 Feb 2010 00:46:08 +0100")
References: <cover.1265759162.git.thomas.petazzoni@free-electrons.com>
	<cover.1265759162.git.thomas.petazzoni@free-electrons.com>
	<93df31e4047f0c5708605570de65bcd1d777c01d.1265759162.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fx5041mb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Add a patch that makes sure config.h gets included in a file that uses
 Thomas> some of the NEEDS_* macros. The yywrap() function was missing when
 Thomas> flex was not available on the target, even though this configuration
 Thomas> is supposed to be supported by at (and handled by NEEDS_YYWRAP).

Thanks - Please also send upstream and CC crossdev at send-patches.org

-- 
Bye, Peter Korsgaard
