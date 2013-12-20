From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Dec 2013 15:52:53 +0100
Subject: [Buildroot] [PATCH] cairo: Build with GLESv2 and VG backends if
	possible
In-Reply-To: <52B44888.4070608@crapouillou.net> (Paul Cercueil's message of
 "Fri, 20 Dec 2013 14:39:20 +0100")
References: <1387243053-5281-1-git-send-email-paul@crapouillou.net>
 <878uvgklnw.fsf@dell.be.48ers.dk> <52B44888.4070608@crapouillou.net>
Message-ID: <87k3ezk20q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

Hi,

 > The following patch addresses the first issue. I reported it upstream.


 > [PATCH] cairo: Patch to fix OpenVG backend on X11-less platforms

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Your mailer had screwed up whitespace in your patch pretty badly, but
I've fixed it up and committed, thanks.


-- 
Bye, Peter Korsgaard
