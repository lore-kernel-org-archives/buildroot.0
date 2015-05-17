From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 08:59:24 +0200
Subject: [Buildroot] [PATCH v2 2/3] python-pyqt: fix install
In-Reply-To: <1429958478-29114-2-git-send-email-gwenj@trabucayre.com>
 (Gwenhael Goavec-Merou's message of "Sat, 25 Apr 2015 12:41:17 +0200")
References: <1429958478-29114-1-git-send-email-gwenj@trabucayre.com>
 <1429958478-29114-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <87lhgn8zar.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > PyQt4 provides two version for some py files: one for python2.x and one for
 > python3.x. This two versions are installed in TARGET_DIR.
 > After installing files, python is used to generate all .pyc files, but fails
 > like :
 > class ProxyBase(metaclass=ProxyMetaclass):
 >                              ^
 > 							 SyntaxError: invalid syntax

 > This patch supdress directory for not targeted python version.

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
