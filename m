From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 08:18:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: add hash file
In-Reply-To: <1425045883-8587-1-git-send-email-syntheticpp@gmx.net> ("Peter
 \=\?utf-8\?Q\?K\=C3\=BCmmel\=22's\?\= message of "Fri,
 27 Feb 2015 15:04:42 +0100")
References: <1425045883-8587-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <87ioemzep9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter K?mmel <syntheticpp@gmx.net> writes:

 > Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
 > ---
 >  package/libmpdclient/libmpdclient.hash | 3 +++
 >  1 file changed, 3 insertions(+)
 >  create mode 100644 package/libmpdclient/libmpdclient.hash

 > diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
 > new file mode 100644
 > index 0000000..d0a4c0e
 > --- /dev/null
 > +++ b/package/libmpdclient/libmpdclient.hash
 > @@ -0,0 +1,3 @@
 > +# Verified against
 > http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.10.tar.xz.sig,
 > sha256 locally computed
 > +sha256 4f08cde82dae70895f8e4532a6e9b54b201efd5591c6b5d6834895807ed2ff82  libmpdclient-2.10.tar.xz
 > +

You have an extra trailing newline here. Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
