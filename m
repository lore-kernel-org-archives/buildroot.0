From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:49:29 +0100
Subject: [Buildroot] [PATCH 14/22] gettext: provide a host variant
In-Reply-To: <1364113606-20836-15-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:38 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-15-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87620hm086.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In preparation for the removal of gettext as a hard dependency,
 Thomas> we need to be able to provide a host variant of gettext for the
 Thomas> few packages that require msgfmt.

Committed, thanks.

-- 
Bye, Peter Korsgaard
