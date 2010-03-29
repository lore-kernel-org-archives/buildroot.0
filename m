From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Mar 2010 13:43:26 +0200
Subject: [Buildroot] [PATCH] libgcrypt: bump to 1.4.5
In-Reply-To: <1269702685-21666-1-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Sat, 27 Mar 2010 16:11:25 +0100")
References: <20100327092241.572378c0@surf>
	<1269702685-21666-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <87ljdbcq01.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Also autotools.in conversion and change source location from gd.tuwien.ac.at to ftp.gnupg.org

Thanks, but you forgot the libgpg_error dependency:

checking for GPG Error - version >= 1.4... no
configure: error: libgpg-error is needed.
                See ftp://ftp.gnupg.org/gcrypt/libgpg-error/ .
make: *** [/tmp/br/build/libgcrypt-1.4.5/.stamp_configured] Error 1

I've fixed that and committed.

-- 
Bye, Peter Korsgaard
