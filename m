From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 22:13:57 +0100
Subject: [Buildroot] [PATCH v2 3/8] gptfdisk: ensure that the package
	always builds/installs something
In-Reply-To: <1362689131-1479-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:45:25 +0100")
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362689131-1479-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87li9vx8iy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Until now, selecting just the gptfdisk package would do
 Thomas> something. If wouldn't build anything at all, and wouldn't
 Thomas> install anything. This is rather odd.

This sounds odd to me. You meant to say that it didn't do anything if
none of the sub options were selected, right?

Committed with some tweaks to the commit message, thanks.

-- 
Bye, Peter Korsgaard
