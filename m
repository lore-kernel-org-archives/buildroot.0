From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Nov 2011 23:14:11 +0100
Subject: [Buildroot] [PATCH 1/3] lsof: fix permission of extracted files
In-Reply-To: <1319148323-26856-1-git-send-email-damian@veritymedical.co.uk>
 (Damian Kaczmarek's message of "Fri, 21 Oct 2011 00:05:23 +0200")
References: <1319148323-26856-1-git-send-email-damian@veritymedical.co.uk>
Message-ID: <87d3ch9nik.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Damian" == Damian Kaczmarek <damian@veritymedical.co.uk> writes:

 Damian> Default tar permissiong make it impossible to apply patches to some of the files
 Damian> Change extraction command to skip permissions by using "-O" tar option
 Damian> and a pipe tar chain. Solution suggested by: Arnout Vandecappelle <arnout@mind.be>

Committed (With Thomas' suggested change), thanks.

-- 
Bye, Peter Korsgaard
