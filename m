From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Apr 2010 11:50:33 +0200
Subject: [Buildroot] Missing something. (Error?)
In-Reply-To: <q2nf70863321004190259lbcec9a85u99a62dcfc1d332e3@mail.gmail.com>
	(Muhammed ER's message of "Mon, 19 Apr 2010 12:59:53 +0300")
References: <q2nf70863321004190259lbcec9a85u99a62dcfc1d332e3@mail.gmail.com>
Message-ID: <87fx2qbggm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Muhammed" == Muhammed ER <er.muhammed@gmail.com> writes:

 Muhammed> Hi,
 Muhammed> I use buildroot last stable version
 Muhammed> ( http://buildroot.net/downloads/buildroot-2010.02.tar.gz )

 Muhammed> Selected : Build/install Objective-C compiler and runtime?

Are you really sure you need an objective C compiler? Objc is normally
only used by Apple developers. The objC stuff was added long time ago,
and I don't recall anyone ever using it, so it might very well be
broken.

Are you perhaps looking for C++ support instead?

I gather we should get rid of the ObjC and Fortran options as they
probably don't work anyway.

-- 
Bye, Peter Korsgaard
