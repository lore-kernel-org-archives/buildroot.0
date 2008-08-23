From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Aug 2008 09:44:44 +0200
Subject: [Buildroot] ### ARM11 Buildroot for MX31
In-Reply-To: <6gvfio$77k560@rrcs-agw-01b.hrndva.rr.com> (steve@fl-eng.com's
	message of "Fri\, 22 Aug 2008 21\:16\:36 -0500")
References: <6gvfio$77k560@rrcs-agw-01b.hrndva.rr.com>
Message-ID: <87od3kuqdv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <steve@fl-eng.com> writes:

Hi,

 > Hello I have downloaded the buildroot package and have built it for
 > the ARM11 MX31 processor from Freescale. It is running with kernel
 > 2.6.22

 > Everything compiles and loads up, I can get a login prompt for
 > username/password from the filesystem produced by buildroot.

 > However, I cannot seem to login. I assumed that the login would be
 > "root" and no password. I looked into the /etc/passwd and
 > /etc/shadow files which seemed to confirm that perhaps
 > root(nopassword) and maybe user(user) was also a login.

Yes, if you use the generic target skeleton (E.G. don't specify
anything special) you will have a root account without a password (but
no "user" account).
