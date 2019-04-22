From: Thomas Huth <huth@tuxfamily.org>
Date: Mon, 22 Apr 2019 07:55:48 +0200
Subject: [Buildroot] [PATCH 1/3] package/xorcurses: new package
In-Reply-To: <CAKcgs2wiC6CcCwqb04G-VqwxdRULhSeQbEXUW+aMwdfwNFz8pw@mail.gmail.com>
References: <20190223205657.18394-1-huth@tuxfamily.org>
 <20190223205657.18394-2-huth@tuxfamily.org>
 <CAKcgs2wiC6CcCwqb04G-VqwxdRULhSeQbEXUW+aMwdfwNFz8pw@mail.gmail.com>
Message-ID: <20190422075548.435d4eca@thl530.multi.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 16 Mar 2019 17:57:28 +0100
schrieb Gilles Talis <gilles.talis@gmail.com>:

> Hello Thomas,
> 
> Thanks for your contribution. Please find some comments below.

 Hi Gilles,

thanks a lot for your review! I finally found some spare time to look
into this again, but I have some questions below...

> Le sam. 23 f?vr. 2019 ? 21:57, Thomas Huth <huth@tuxfamily.org> a
> ?crit :
[...]
> > diff --git a/package/xorcurses/xorcurses.hash
> > b/package/xorcurses/xorcurses.hash new file mode 100644
> > index 0000000000..49d3a0c3b9
> > --- /dev/null
> > +++ b/package/xorcurses/xorcurses.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha512
> > 1782ebf6ae8798b32e0a8e5e20e6d0b44eb619f6e7f015735c6e86205bd545da108c36bff1c9cfc9e9b44dee8f90bacb9df70436991f57f51c2c87e94b3a4725
> > XorCurses-0.2.2.tar.bz2  
> You also need to provide the hash for the license file.

There does not seem to be a license file in the tarball here, they just
mention in the README that the game is licensed under the GPL. I guess
I can skip the hash for the license file in this case?

 Thomas
