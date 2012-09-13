From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Sep 2012 12:29:59 +0200
Subject: [Buildroot] [network-manager] Apply upstream patch to fix
	compilation with kernel-headers >= 3.4
In-Reply-To: <CAG2jQ8jTO66cWd8UG-=mxWgihLJf=RETGizK0q_8YOapUbGo3g@mail.gmail.com>
 (Markos Chandras's message of "Thu, 13 Sep 2012 09:17:23 +0100")
References: <CAG2jQ8g+0WkYnR2k-8jaLXHOFRA2OPiuQWeD==B6gdE67N=4OA@mail.gmail.com>
 <877grzszx8.fsf@macbook.be.48ers.dk>
 <CAG2jQ8jTO66cWd8UG-=mxWgihLJf=RETGizK0q_8YOapUbGo3g@mail.gmail.com>
Message-ID: <87r4q6qkpk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

Hi,

 Markos> There is no need to apply this patch if you bump the
 Markos> package. This patch only fixes the compilation problem for
 Markos> version 0.9.2.0, which is the one we have on buildroot.

Ahh, I thought it was a post-0.9.6 change. Any reason to not just move
to the latest upstream?

I gather that you are using the network manager package? I'm not using
it myself, perhaps you would be interested in testing 0.9.6?

-- 
Bye, Peter Korsgaard
