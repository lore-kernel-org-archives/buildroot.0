From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 18:37:05 +0100
Subject: [Buildroot] [PATCH v2 2/8] lttng-babeltrace: make available for
	all C libraries
In-Reply-To: <1453929930-18215-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 27 Jan 2016 22:25:24 +0100")
References: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453929930-18215-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a8nkcoxq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Due to posix_fallocate() being unavailable in uClibc 0.9.33,
 > lttng-babeltrace was marked as available only for uClibc snapshot in

s/in/and/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
