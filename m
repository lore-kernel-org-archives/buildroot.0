From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Sep 2012 21:28:45 +0200
Subject: [Buildroot] [PATCH v2] vala: fix documentation build problem
In-Reply-To: <1347961957-14841-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Sep 2012 11:52:37 +0200")
References: <1347961957-14841-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9wnnn9u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On gcc10, the build of the host-vala documentation causes a
 Thomas> segmentation fault of xsltproc, for some unknown reason. See:

Committed, thanks.

-- 
Bye, Peter Korsgaard
