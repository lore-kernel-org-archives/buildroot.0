From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 21:18:17 +0200
Subject: [Buildroot] [PATCH 006/121] package/fbtft: add hash file
In-Reply-To: <59cf452d312d4c92cd1bb948637c9538abd8206e.1466334225.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 19 Jun 2016 13:08:53 +0200")
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <59cf452d312d4c92cd1bb948637c9538abd8206e.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <87d1nd3s3q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/fbtft/fbtft.hash | 2 ++
 >  1 file changed, 2 insertions(+)
 >  create mode 100644 package/fbtft/fbtft.hash

 > diff --git a/package/fbtft/fbtft.hash b/package/fbtft/fbtft.hash
 > new file mode 100644
 > index 0000000..d294a54
 > --- /dev/null
 > +++ b/package/fbtft/fbtft.hash
 > @@ -0,0 +1,2 @@
 > +# localy computed
 > +sha256
 > 0e81de89fdd7ab810716fc0549e767527f342e829309dee5c2cca1e9d1728770
 > fbtft-274035404701245e7491c0c6471c5b72ade4d491.tar.gz

I'm not sure where this went wrong, but this one got word wrapped
somewhere so git am ends up adding a line with just 'sha256'.

Fixed that up while committing (don't resend).

-- 
Bye, Peter Korsgaard
