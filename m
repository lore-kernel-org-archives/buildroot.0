From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 14:51:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: add hash file
In-Reply-To: <1425041237-3204-1-git-send-email-syntheticpp@gmx.net> ("Peter
 \=\?utf-8\?Q\?K\=C3\=BCmmel\=22's\?\= message of "Fri,
 27 Feb 2015 13:47:17 +0100")
References: <1425041237-3204-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <877fv331kn.fsf@dell.be.48ers.dk>
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
 > index 0000000..93f372c
 > --- /dev/null
 > +++ b/package/libmpdclient/libmpdclient.hash
 > @@ -0,0 +1,3 @@
 > +# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.10.tar.gz.sig, sha256 locally computed
 > +sha256 bf88ddd9beceadef11144811adaabe45008005af02373595daa03446e6b1bf3d  libmpdclient-2.10.tar.gz

Ehh, we are using libmpdclient-2.10.tar.XZ!

-- 
Bye, Peter Korsgaard
