From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Feb 2011 21:08:51 +0100
Subject: [Buildroot] [PATCH with ACK/SOBs 1/2] docs: fix
	$(PKG)_SITE_METHOD names (UPPER CASE => lower case)
In-Reply-To: <1297018925-12863-1-git-send-email-bjorn.forsman@gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Sun,
	6 Feb 2011 20:02:04 +0100")
References: <1297018925-12863-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <87ei7lylgs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 Bj?rn> Currently, the documentation says $(PKG)_SITE_METHOD should have
 Bj?rn> upper case names such as SVN or GIT, but the implementation only
 Bj?rn> accepts lower case svn or git. This fixes the documentation.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
