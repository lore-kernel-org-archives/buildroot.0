From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Oct 2015 02:11:18 +0200
Subject: [Buildroot] [PATCH 1/2] libtorrent: bump to version 0.13.6
In-Reply-To: <1444002976-63670-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 5 Oct 2015 00:56:15 +0100")
References: <1444002976-63670-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87vbamp42h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > - Bump to version 0.13.6.
 > - Add a hash file.

 > - Change the website URL to the new official one.

 > - Help the build system to find the zlib headers, otherwise the
 >   configure script will fail like this:

 >     checking if zlib is wanted... yes
 >     checking for inflateEnd in -lz... no
 >     checking zlib.h usability... no
 >     checking zlib.h presence... no
 >     checking for zlib.h... no
 >     configure: error: either specify a valid zlib installation with
 >     --with-zlib=DIR or disable zlib usage with --without-zlib

 > - Disable instrumentation support by default since it avoids runtime
 >   failures on rtorrent for some architectures like MIPS, PowerPC or ARM:

 >     https://github.com/rakshasa/rtorrent/issues/156

 > - Tweak the 0001-cross_compile.patch for this new version.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
