From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jul 2013 11:11:09 +0200
Subject: [Buildroot] [PATCH 21/23] eglibc: new package
In-Reply-To: <1372620553-11416-22-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:11 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-22-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v1mn102.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit adds a target 'eglibc' package. For now, there is no way
 Thomas> to build this package, the next commit will add the integration of
 Thomas> eglibc into the Buildroot toolchain backend.

Committed, thanks.

 Thomas> +#  2. We have to execute the configure script with bash and not sh.

I think I remember other configure scripts having problems with
dash. Perhaps we should always do this in pkg-autotools.mk?

-- 
Bye, Peter Korsgaard
