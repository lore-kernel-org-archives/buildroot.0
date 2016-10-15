From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 16:39:55 +0200
Subject: [Buildroot] [PATCH] gcc: add patches to fix PR70473
In-Reply-To: <1476539598-31097-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 15 Oct 2016 15:53:18 +0200")
References: <1476539598-31097-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877f99d6bo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > gc 5.x introduced a regression in the ARM build, which causes the

s/gc /gcc /

Committed, thanks. Lets hope this fixes the travis issues.

-- 
Bye, Peter Korsgaard
