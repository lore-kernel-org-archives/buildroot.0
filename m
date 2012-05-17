From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 May 2012 20:59:52 +0200
Subject: [Buildroot] [PATCH] opencv: add zlib dependency
In-Reply-To: <1337267482-6849-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 17 May 2012 17:11:22 +0200")
References: <1337267482-6849-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehqipr9z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The opencv package selects zlib, but it does not depend on it. This
 Thomas> leads to cases where opencv gets built before zlib, and in this case,
 Thomas> opencv uses its internal version of zlib, which doesn't build properly
 Thomas> (it has some conditional code for ARM that is probably broken), see:

Committed, thanks.

-- 
Bye, Peter Korsgaard
