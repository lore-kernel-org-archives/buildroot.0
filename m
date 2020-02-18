From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2020 23:14:58 +0100
Subject: [Buildroot] [PATCH] package/owfs: fixup Python sysconfigdata
 for per-package directories
In-Reply-To: <20200217235523.107701-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 18 Feb 2020 00:55:22 +0100")
References: <20200217235523.107701-1-thomas.petazzoni@bootlin.com>
Message-ID: <87h7znee59.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This is needed so that building the owfs Python module uses the gcc
 > from owfs per-package directory, and not the one from the python
 > per-package directory.

 > Fixes:

 >   http://autobuild.buildroot.net/results/0d582dda367507991a4c38141db36b0fa8e47e67/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
