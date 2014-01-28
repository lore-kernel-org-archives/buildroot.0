From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 14:11:50 +0100
Subject: [Buildroot] [PATCH] erlang: bump version to R16B03-1
In-Reply-To: <1390869775-13612-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Mon, 27 Jan 2014 19:42:55 -0500")
References: <1390869775-13612-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87a9eg45ex.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > OTP R16B03-1 is a service release which corrects a few issues found in
 > the R16B03 release. The corrections are:

 >  - The ODBC application was missing in the prebuilt Windows installers
 >  - 3 corrections in the SSL application:
 >    - Add missing validation of the server_name_indication option and test for
 >      its explicit use.
 >    - Elliptic curve selection in server mode now properly selects a curve
 >      suggested by the client, if possible.
 >    - The server did not indicate support for secure renegotiation during TLS
 >      extension handling.
 >  - In the syntax tools application a bug was introduced which broke
 >    reverting of local funs. This is now corrected (thanks to Anthony
 >    Ramine)
 >  - wx - Solved a problem which caused the debugger to crash when closing a
 >    window. Fixed static linking on Mac.
 >  - xmerl - Fixed a problem in the SAX-parser when the header of the next
 >    document was appearing in the buffer when using the
 >    xmerl_sax_parser:stream/2 function.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
