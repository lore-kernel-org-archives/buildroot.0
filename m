From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 22:25:33 +0200
Subject: [Buildroot] [PATCH 20/28] package: add support for
	post-download hooks
In-Reply-To: <396f22aadbba052e2dff88a399347f001292d099.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:54:11 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <396f22aadbba052e2dff88a399347f001292d099.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87box1yjb6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This will be needed for the Linux kernel package, which needs to
 Thomas> download patches in a custom way.

Committed, thanks.

It would be good to document this in docs/buildroot.html

-- 
Bye, Peter Korsgaard
