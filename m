From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Feb 2012 11:00:57 +0100
Subject: [Buildroot] [PATCH 1/7] liburcu: add patch to fix build with
	uClibc
In-Reply-To: <fef652a4afaa01890b129d278dbb0a950ca63e3e.1328366921.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 4 Feb 2012 15:48:42 +0100")
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <fef652a4afaa01890b129d278dbb0a950ca63e3e.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ty35sip2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Under uClibc, defining _GNU_SOURCE is strictly needed to access the
 Thomas> CPU_*() macros.

Committed, thanks. Don't forget to send patch upstream.

-- 
Bye, Peter Korsgaard
