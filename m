From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Nov 2013 12:20:07 +0100
Subject: [Buildroot] [PATCH] libroxml: fix avr32 build failure
In-Reply-To: <1385054380-20684-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 21 Nov 2013 17:19:40 +0000")
References: <1385054380-20684-1-git-send-email-spdawson@gmail.com>
Message-ID: <87ob5cptso.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > The -Wno-unused-result option is not understood by the version of gcc used by the
 > avr32 toolchain. Remove the option from the compilation flags.

 > Fixes build failures such as the following.

 >   http://autobuild.buildroot.net/results/e22/e22d94fca3eabb4e54d82af04319f17ad8e10c20/

 > The single existing patch for libroxml has been renamed to include a
 > numerical component for application order sorting. The existing patch
 > has also been updated to apply without fuzz.

Committed, thanks.

-- 
Bye, Peter Korsgaard
