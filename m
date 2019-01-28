From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:03:16 +0100
Subject: [Buildroot] [PATCH] package/gnutls: bump to version 3.6.6
In-Reply-To: <20190128164229.2mblf4wbvf5zie7g@sapphire.tkos.co.il> (Baruch
 Siach's message of "Mon, 28 Jan 2019 18:42:29 +0200")
References: <20190128160854.32691-1-peter@korsgaard.com>
 <20190128164229.2mblf4wbvf5zie7g@sapphire.tkos.co.il>
Message-ID: <87y374cx63.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Mon, Jan 28, 2019 at 05:08:54PM +0100, Peter Korsgaard wrote:
 >> Drop now upstreamed 0001-configure.ac-check-if-libatomic-is-needed.patch and
 >> autoreconf.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---

 > [...]

 >> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
 >> index 89e8b14597..f33d8672d4 100644
 >> --- a/package/gnutls/gnutls.hash
 >> +++ b/package/gnutls/gnutls.hash
 >> @@ -1,6 +1,6 @@
 >> # Locally calculated after checking pgp signature
 >> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.5.tar.xz.sig
 >> -sha256	073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35	gnutls-3.6.5.tar.xz
 >> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.6.tar.xz.sig
 >> +none	bb9acab8af2ac430edf45faaaa4ed2c51f86e57cb57689be6701aceef4732ca7	gnutls-3.6.6.tar.xz

 > Why none?

Crap, because I was doing too many unrelated things at the same time. I
set it to none to not have buildroot throw the tarball away before I
had calculated sha256.

Committed after fixing that, thanks.

-- 
Bye, Peter Korsgaard
