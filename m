From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Feb 2015 20:03:39 +0100
Subject: [Buildroot] [PATCH] mono: add patch to fix MIPS build issue
In-Reply-To: <1423233944-1722-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 6 Feb 2015 15:45:44 +0100")
References: <1423233944-1722-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbje981g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since the bump to version 3.12 of Mono, it fails to build on MIPS. The
 > patch added by this commit fixes this build failure, simply caused by
 > a missing include.

 > Fixes:

 >   http://autobuild.buildroot.org/results/6f5/6f5e20a4a99eb0db650430bf6285c844fd940711/

 > Submitted upstream at https://github.com/mono/mono/pull/1550.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
