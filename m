From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jun 2021 18:22:49 +0200
Subject: [Buildroot] [git commit] package/perl-crypt-openssl-rsa: add
 missing dependency to openssl
In-Reply-To: <20210612210930.1CC3681819@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 12 Jun 2021 23:32:03 +0200")
References: <20210612210930.1CC3681819@busybox.osuosl.org>
Message-ID: <87tulsbj52.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7c636d9c6601538920f6e46955168f41b458a287
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > perl-crypt-openssl-rsa inherits the dependency on openssl indirectly
 > from perl-crypt-openssl-random. Hwvere, perl-crypt-openssl-rsa needs
 > the openssl libraries for itself, so it must explicitly depend on it.

 > So far, this was totally unconsequential, but since commit a83d41867c8d
 > (package/libopenssl: add option to enable some features), features can
 > be configured out, of which RMD160 that perl-crypt-openssl-rsa needs.
 > If we were to add the select to that option (in a followup commit),
 > without a dependency to openssl, that would be very confusing in the
 > future.

 > So, add the explicit dependency now.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
