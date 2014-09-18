From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Sep 2014 22:02:03 +0200
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.2.18
In-Reply-To: <1411064789-19370-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 18 Sep 2014 15:26:29 -0300")
References: <1411064789-19370-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a95w66kk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Also add hash, calculated on downloaded file after verifying signature.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/gnutls/gnutls.hash | 2 ++
 >  package/gnutls/gnutls.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 1 deletion(-)
 >  create mode 100644 package/gnutls/gnutls.hash

 > diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
 > new file mode 100644
 > index 0000000..c68a792
 > --- /dev/null
 > +++ b/package/gnutls/gnutls.hash
 > @@ -0,0 +1,2 @@
 > +# Hand caculated after checking pgp signature

I changes this to 'Locally calculated' and committed, thanks.

-- 
Bye, Peter Korsgaard
