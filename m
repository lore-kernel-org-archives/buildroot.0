From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 12 Dec 2006 14:29:47 +0100
Subject: [Buildroot] [PATCH] fix libcgi building
In-Reply-To: <20061212124548.GA25794@tuxedo.home.lan>
References: <20061212124548.GA25794@tuxedo.home.lan>
Message-ID: <20061212132947.GA30548@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 12, 2006 at 01:45:48PM +0100, Lars Munch wrote:
>Hi all
>
>The attached patch fixes af few issues with libcgi:
>
>* Remove bogus tab in libcgi.mk that prevented the library from being build
>* Added headerfiles to STAGING_DIR in usr/include/libcgi so that we
>  can actually use the library with the toolchain
>* Added patch that fixes up the makefile.in and fixes a few bugs in libcgi
>
>Most of the patch has been taken from the debian package.
>
>Please apply.

Applied. Thanks!
