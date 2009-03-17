From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Mar 2009 09:23:33 +0100
Subject: [Buildroot] svn commit: [25683] trunk/buildroot: package project
In-Reply-To: <20090317085535.28fe4e4d@surf> (Thomas Petazzoni's message of
	"Tue\, 17 Mar 2009 08\:55\:35 +0100")
References: <20090316154844.13B657643C@busybox.osuosl.org>
	<20090316200849.2beaada3@surf> <87fxhdp8u4.fsf@macbook.be.48ers.dk>
	<20090317085535.28fe4e4d@surf>
Message-ID: <87y6v4o8vu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I'll move over the existing host tools (pkgconfig, auto*, libtool)
 >> soonish.

 Thomas> Great. What about the toolchain itself ? It is a host tool after all,
 Thomas> isn't it ?

True - But it seems like setting BR2_STAGING_DIR to something outside
the tree (E.G. /opt/toolchain) and using it outside buildroot is
fairly common - The other host tools are just needed for building the
rootfs and are not (generally) useful outside BR.

-- 
Bye, Peter Korsgaard
