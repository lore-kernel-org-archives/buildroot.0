From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jun 2016 21:13:25 +0200
Subject: [Buildroot] [PATCH] libarchive: security bump to version 3.2.1
In-Reply-To: <1466643375-12911-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 22 Jun 2016 21:56:15 -0300")
References: <1466643375-12911-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8760szvhuy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-4302 - Libarchive Rar RestartModel Code Execution Vulnerability
 > CVE-2016-4300 - Libarchive 7zip read_SubStreamsInfo Code Execution
 > Vulnerability
 > CVE-2016-4809 - Memory allocate error in corrupted cpio archives

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
