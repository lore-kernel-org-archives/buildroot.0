From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Mar 2018 17:19:05 +0100
Subject: [Buildroot] [PATCH 2/2] support/dependencies/dependencies.sh:
 check for Python argparse module
In-Reply-To: <20180303143620.16859-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 3 Mar 2018 15:36:20 +0100")
References: <20180303143620.16859-1-thomas.petazzoni@bootlin.com>
 <20180303143620.16859-2-thomas.petazzoni@bootlin.com>
Message-ID: <87muzpb092.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The script support/scripts/check-uniq-files uses the argparse Python
 > module. In most recent Python versions (starting with 2.7), the
 > argparse module is part of the standard library, and we already check
 > for the availability of Python in
 > support/dependencies/dependencies.sh.

 > However, when running on an ancient distribution with Python 2.6, the
 > argparse module is not part of the Python standard library, but
 > available as an external module. Without this module, the build fails,
 > because check-uniq-files, which is used in target-finalize, fails to
 > run.

 > To avoid this failure, this commit adds a check in
 > support/dependencies/dependencies.sh to verify that the argparse
 > module is available.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
