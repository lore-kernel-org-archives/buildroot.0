From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:50:09 +0100
Subject: [Buildroot] [PATCH 15/22] libglib2: add dependency on
	host-gettext
In-Reply-To: <1364113606-20836-16-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:39 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-16-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871ub5m072.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> libglib2 requires msgfmt, which is now provided by host-gettext since
 Thomas> gettext will no longer be part of the mandatory dependencies.

Committed, thanks.

-- 
Bye, Peter Korsgaard
