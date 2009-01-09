From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jan 2009 11:21:16 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <87ljtkrg83.fsf@macbook.be.48ers.dk>
References: <20090108225832.382AD77108@busybox.osuosl.org>
	<87ljtkrg83.fsf@macbook.be.48ers.dk>
Message-ID: <20090109112116.63cb1701@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 09 Jan 2009 10:17:16 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Why the extra dir? Why isn't mkimage just installed into
> STAGING_DIR/usr/bin and used from there?

I think we should stop mixing host and target binaries and libraries in
$(STAGING_DIR). But that's another story :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
