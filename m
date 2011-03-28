From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Mar 2011 00:23:57 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.autotools.in: add
	libtool v2.4 support
In-Reply-To: <20110329000323.77c0d0d0@surf> (Thomas Petazzoni's message of
	"Tue, 29 Mar 2011 00:03:23 +0200")
References: <20110328194623.C0431819DC@busybox.osuosl.org>
	<20110329000323.77c0d0d0@surf>
Message-ID: <87zkoe28aq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Mon, 28 Mar 2011 21:45:06 +0200
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> wrote:

 >> Packages (like avahi) are now using libtool 2.4, so extend the libtool
 >> handling to support those as well.

 Thomas> I thought libtool v2.4 was supposed to support --sysroot and therefore
 Thomas> to not need any of our dirty cross-compilation tricks. Am I wrong ?

Well, avahi failed for me atleast with dependent libs (it tried to
relink during installation against native libs) - With the patch it
works here, but I must admit I didn't look into the details.

-- 
Bye, Peter Korsgaard
