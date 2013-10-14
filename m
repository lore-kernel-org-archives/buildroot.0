From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 22:02:58 +0200
Subject: [Buildroot] [PATCH] autossh: new package
In-Reply-To: <1381758371-13587-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 14 Oct 2013 10:46:11 -0300")
References: <1381758371-13587-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fvs3pqml.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

Have you used it with dropbear? I think I recall some discussion about
it using openssh specific options. If so, then it should probably depend
on BR2_PACKAGE_OPENSSH

-- 
Bye, Peter Korsgaard
