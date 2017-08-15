From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 15 Aug 2017 03:47:21 -0700 (PDT)
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
	package
In-Reply-To: <20170227232240.GB2535@tungsten.ozlabs.ibm.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
 <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
 <20170224092549.2c560db3@free-electrons.com>
 <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
 <20170227150637.ljo2c6dv3izstddn@tarshish>
 <20170227232240.GB2535@tungsten.ozlabs.ibm.com>
Message-ID: <1502794041870-173505.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi;

I know this post is a bit old; however, I would really like to see
gobject-introspection added
to Buildroot.

It's preventing a fair amount of packages from being updated.  Heck,
python-gobject is stuck
at 2.28.6 because of this, which is from 2011!  Adding this dependency is
beyond my capabilities; however
I do see the importance of it, which is why I would like to see this patch
series brought back to life.

Thanks!

Adam



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/RFC-PATCH-0-2-add-gobject-introspection-tp157754p173505.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
