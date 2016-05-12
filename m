From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 May 2016 12:29:03 +0200
Subject: [Buildroot] SSL / HSTS issue with git.busybox.net
In-Reply-To: <ph9d4pbe3ii050fibo946l51.1463034609289@email.lge.com>
 (root@renaud.io's message of "Thu, 12 May 2016 08:30:09 +0200")
References: <ph9d4pbe3ii050fibo946l51.1463034609289@email.lge.com>
Message-ID: <87lh3fin80.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "root at renaud" == root at renaud io <root@renaud.io> writes:

 > Hi,

> Trying to fetch this morning and facing a
> SEC_ERROR_EXPIRED_CERTIFICATE (since 06:43 this very morning).

Ups, indeed. Seems like our letsencrypt update handling isn't
working. Mike, care to take a look?

-- 
Bye, Peter Korsgaard
