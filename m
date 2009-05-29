From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 May 2009 17:13:28 +0200
Subject: [Buildroot] 202: Illegal number: gcc
In-Reply-To: <87bppc570t.fsf@macbook.be.48ers.dk>
References: <133898.99840.qm@web111905.mail.gq1.yahoo.com>
	<87bppc570t.fsf@macbook.be.48ers.dk>
Message-ID: <20090529171328.1842d7f4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 29 May 2009 16:16:18 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Do you have makeinfo installed (the texinfo package) and what is it's
> version? Any particular reason why you are building binutils 2.18 and
> not the standard 2.19.1?

IIRC, there used to be a bug in binutils check for makeinfo. If the
makeinfo version was too recent, then the regexp used in the binutils
check didn't find makeinfo as a valid version.

See http://gcc.gnu.org/ml/gcc-patches/2007-09/msg01271.html

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
