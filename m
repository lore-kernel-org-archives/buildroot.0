From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Apr 2013 15:54:53 +0200
Subject: [Buildroot] [PATCHv5 01/14] qt5: disallow the selection of Qt4
	and Qt5
In-Reply-To: <1365364648-30568-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 7 Apr 2013 21:57:15 +0200")
References: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365364648-30568-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehehw4sy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As noticed by Arnout, Qt4 and Qt5 cannot be installed together,
 Thomas> because for example the qt.conf installed by one version cannot be
 Thomas> understood by the qmake of another version. We therefore make them
 Thomas> mutually exclusive, which sounds reasonable for the embedded systems
 Thomas> targeted by Buildroot.

Committed, thanks.

-- 
Bye, Peter Korsgaard
