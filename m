From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Oct 2013 21:11:20 +0200
Subject: [Buildroot] [PATCH 1/2] proxychains-ng: needs dynamic library
	support
In-Reply-To: <1380947459.27085.0.camel@phoenix> (Axel Lin's message of "Sat,
 05 Oct 2013 12:30:59 +0800")
References: <1380947459.27085.0.camel@phoenix>
Message-ID: <871u3zild3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Fix below build error if BR2_PREFER_STATIC_LIB is set:

 Axel> src/libproxychains.c:34:19: fatal error: dlfcn.h: No such file or directory
 Axel> compilation terminated.
 Axel> make[1]: *** [src/libproxychains.o] Error 1

 Axel> In additional, the README file also mentions that this program
 Axel> works only on dynamically linked programs.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
