From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Nov 2011 09:29:38 +0100
Subject: [Buildroot] [PATCH 05/10] diffutils: bump to version 3.2
In-Reply-To: <1321223278-14388-5-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 13 Nov 2011 19:27:53 -0300")
References: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
 <1321223278-14388-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87sjlrw1hp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump to diffutils version 3.2
 Gustavo> Drop all unnecessary configure hints.
 Gustavo> There's no point in installing diffutils to staging so drop that too.
 Gustavo> Build after busybox if it's enabled to prefer full-blown diff.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
