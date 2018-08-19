From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Aug 2018 21:50:58 +0200
Subject: [Buildroot] [PATCH] python-pyqt5: add Qt 5.11 compatibility
 patch
In-Reply-To: <20180818210208.23097-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 18 Aug 2018 23:02:08 +0200")
References: <20180818210208.23097-1-thomas.petazzoni@bootlin.com>
Message-ID: <877ekmm8yl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit adds a patch to python-pyqt5 to make it build properly
 > against Qt 5.11.

 > PyQt5 is using a dual-licensing model, and the commercial company
 > behind it (RiverBank) only provides release tarballs, and no public
 > Git repository, so we cannot see the individual changes they make. By
 > diffing the PyQt5 5.10 and 5.11 releases, we could see that they opted
 > for dropping entirely support for the waitForEvents() method, rather
 > than keeping it for Qt < 5.11. We take the same approach in the below
 > patch, since this is anyway what will happen when we will bump to
 > PyQt5 5.11.

 > The patch is not Git-formatted, because there is no upstream Git
 > repository for this project.

 > Fixes:

 >   http://autobuild.buildroot.net/results/1f1e92374fe71a1d4343243db5f530c33db06698/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
