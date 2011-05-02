From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 May 2011 21:40:23 +0200
Subject: [Buildroot] [PATCH 2/3] libxml2: fixup configure options
In-Reply-To: <1304363303-14984-2-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Mon, 2 May 2011 16:08:22 -0300")
References: <1304363303-14984-1-git-send-email-gustavo@zacarias.com.ar>
	<1304363303-14984-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tydcsxg8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Some configure options changed so adjust.
 Gustavo> Forcibly disabling threads isn't good and also it's detected by
 Gustavo> configure when there are no threads.

Committed, thanks.

-- 
Bye, Peter Korsgaard
