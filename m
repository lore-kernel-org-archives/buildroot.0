From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 May 2012 23:22:15 +0200
Subject: [Buildroot] [PATCH 2/2] screen: enable terminfo and install
	screenrc
In-Reply-To: <1336386817-29877-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 7 May 2012 07:33:37 -0300")
References: <1336386817-29877-1-git-send-email-gustavo@zacarias.com.ar>
 <1336386817-29877-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y5p3hek8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Enable terminfo support as reported on bug #5198
 Gustavo> Also install screenrc if it's not already present in the target.

Committed, thanks.

-- 
Bye, Peter Korsgaard
