From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 09:00:13 +0200
Subject: [Buildroot] [PATCH 02/23] busybox: don't use kernel headers
	directly
In-Reply-To: <1372620553-11416-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:28:52 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zju4qgaq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The kernel headers are part of the staging directory, so there is no
 Thomas> reason to point the Busybox CFLAGS directly to them.

Committed, thanks.

-- 
Bye, Peter Korsgaard
