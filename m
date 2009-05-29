From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 May 2009 16:16:18 +0200
Subject: [Buildroot] 202: Illegal number: gcc
In-Reply-To: <133898.99840.qm@web111905.mail.gq1.yahoo.com> (Peter Weichai's
	message of "Fri\, 29 May 2009 05\:58\:59 -0700 \(PDT\)")
References: <133898.99840.qm@web111905.mail.gq1.yahoo.com>
Message-ID: <87bppc570t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Weichai <peterweichai@yahoo.com> writes:

 Peter> Hi Guys,

 Peter> I'm trying to build buildroot on my ubuntu system. I
 Peter> encountered the below problem. Need advice. The error might
 Peter> due to my gcc and g++? Any idea how to solve it?

 Peter> Thanks in advance


 Peter> Checking build system dependencies:
 Peter> BUILDROOT_DL_DIR clean:                Ok
 Peter> CC clean:                    Ok
 Peter> CXX clean:                    Ok
 Peter> CPP clean:                    Ok
 Peter> CFLAGS clean:                    Ok
 Peter> INCLUDES clean:                    Ok
 Peter> CXXFLAGS clean:                    Ok
 Peter> which installed:                Ok
 Peter> sed works:                    Ok (/bin/sed)
 Peter> GNU make version '3.81':            Ok
 Peter> [: 202: Illegal number: gcc
 Peter> C compiler '/usr/bin/gcc'
 Peter> C compiler version 'gcc':            Ok
 Peter> [: 233: Illegal number: g++

Strange. Could you please send the output of:

gcc --version and g++ --version

 Peter> WARNING: `makeinfo' is missing on your system.  You should only need it if
 Peter>          you modified a `.texi' or `.texinfo' file, or any other file
 Peter>          indirectly affecting the aspect of the manual.  The spurious
 Peter>          call might also be the consequence of using a buggy `make' (AIX,
 Peter>          DU, IRIX).  You might want to install the `Texinfo' package or
 Peter>          the `GNU make' package.  Grab either from any GNU archive site.

Do you have makeinfo installed (the texinfo package) and what is it's
version? Any particular reason why you are building binutils 2.18 and
not the standard 2.19.1?

-- 
Bye, Peter Korsgaard
