From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 10:38:13 +0100
Subject: [Buildroot] [PATCH] gcc: drop gcc 4.5 specific code
In-Reply-To: <1457476243-9401-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Mar 2016 23:30:43 +0100")
References: <1457476243-9401-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878u1s2dq2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > We have removed gcc 4.5 support since a long time, so this commit
 > removes dead code that was only used when building a toolchain based
 > on gcc 4.5.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
