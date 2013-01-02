From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jan 2013 15:53:17 +0100
Subject: [Buildroot] [PATCH 1/2] gnutls: fix build failure related to
	pthreads
In-Reply-To: <1357138210-4455-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Jan 2013 11:50:09 -0300")
References: <1357138210-4455-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hamzr602.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The pthreads autodetection posions the linkpath thus making other

s/posions/poisons/

Committed both with that fixed, thanks.

-- 
Bye, Peter Korsgaard
