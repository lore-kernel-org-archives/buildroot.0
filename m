From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 May 2014 22:19:56 +0200
Subject: [Buildroot] [PATCH] libbluray: needs dynamic library support
In-Reply-To: <1399919032-9512-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 12 May 2014 20:23:52 +0200")
References: <1399919032-9512-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878uq67nrn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The dependency is propagated to XBMC, even though XBMC currently
 > requires an (e)glibc toolchain, which always have dynamic library
 > support. This is just in case one day XBMC can be built against
 > uClibc.

 > Fixes:

 >   http://autobuild.buildroot.org/results/3fa/3fae35ebcf14d6f38284d8318f61f9b99998794c/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
