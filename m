From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:51:50 +0100
Subject: [Buildroot] [PATCH 25/28] xvkbd: fix X.org dependencies
In-Reply-To: <9cd5652426d94c1e64d34ac861e312092483c7b5.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:37 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <9cd5652426d94c1e64d34ac861e312092483c7b5.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fw261349.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> xvkbd is a X.org client application, so there is no reason to depend
 Thomas> on the X.org server. Instead, depend on the X.org client libraries
 Thomas> that xvkbd actually links against.

Committed, thanks.

-- 
Bye, Peter Korsgaard
