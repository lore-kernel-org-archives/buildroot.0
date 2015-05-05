From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 May 2015 17:26:13 +0200
Subject: [Buildroot] [PATCH v3 1/2] python-pyqt: fix install
In-Reply-To: <1430836434-24257-1-git-send-email-gwenj@trabucayre.com>
 (Gwenhael Goavec-Merou's message of "Tue, 5 May 2015 16:33:53 +0200")
References: <1430836434-24257-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <876187oxka.fsf@dell.be.48ers.dk>
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

 > This is not a package build failure and this fix is only cosmetic.
 > This patch suppress directory for not targeted python version.

Do we have any autobuilder results showing this?

-- 
Bye, Peter Korsgaard
