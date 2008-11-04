From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Nov 2008 20:17:25 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20081104181409.63a40a42@surf> (Thomas Petazzoni's message of
	"Tue\, 4 Nov 2008 18\:14\:09 +0100")
References: <20081103201104.190E7F8015@busybox.net>
	<20081104082320.667f3022@surf> <87prlb96au.fsf@macbook.be.48ers.dk>
	<20081104181409.63a40a42@surf>
Message-ID: <87k5bj1et6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Tue, 04 Nov 2008 10:41:45 +0100,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> That looks more like a problem about glib-genmarshal not being
 >> installed on the host (E.G. something like a libglib2.0-dev package)

 Thomas> Yep, there are two solutions:

 Thomas>  * Require glib-genmarshal to be installed on the host, in
 Thomas>  which case it should be checked prior to the compilation
 Thomas>  process ;

That's how it's currently done (see HOST_GLIB). The check is currently
missing - It should probably be added to libglib2.mk

-- 
Bye, Peter Korsgaard
