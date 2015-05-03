From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 May 2015 16:31:40 +0200
Subject: [Buildroot] [PATCH] cc-tool: fix missing stdarg.h include on
	uClibc
In-Reply-To: <1430658539-7438-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 May 2015 15:08:59 +0200")
References: <1430658539-7438-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a8xlu3zn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to fix a missing <stdarg.h> include for
 > va_list.

 > Fixes:

 >   http://autobuild.buildroot.org/results/9c8/9c828b1da8983577f93bdfae5275fc5122ae874f/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
