From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 12:12:03 +0100
Subject: [Buildroot] [PATCH 4/5] Makefile: add pkg-stats target
In-Reply-To: <20201105163024.1387248-5-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 5 Nov 2020 17:30:22 +0100")
References: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
 <20201105163024.1387248-5-thomas.petazzoni@bootlin.com>
Message-ID: <877dqskv0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Now that pkg-stats is not just a maintainer-oriented tool, but a tool
 > generally useful to users, introduce a make target to run
 > pkg-stats. Of course, it is run with the newly introduced -c option,
 > which produces a pkg-stats output for just the selection of packages
 > of the currently defined configuration.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
