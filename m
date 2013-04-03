From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Apr 2013 22:47:07 +0200
Subject: [Buildroot] [PATCH] dropbear: add vfork fix
In-Reply-To: <1364941788-15890-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 2 Apr 2013 19:29:48 -0300")
References: <1364941788-15890-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjxf5ol0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Causes scp to fail badly.

Committed, thanks.

Do we need the /dev/urandom write fix as well?

-- 
Bye, Peter Korsgaard
