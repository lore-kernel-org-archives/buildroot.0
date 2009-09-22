From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Sep 2009 22:51:05 +0200
Subject: [Buildroot] Is DirectFb.org down?
In-Reply-To: <1253651876.451.40.camel@station1.ormlab.com> (Ormund Williams's
	message of "Tue\, 22 Sep 2009 16\:37\:56 -0400")
References: <BLU126-W2171CCAFA65907A9231DA4C7DE0@phx.gbl>
	<87k4ztwq6n.fsf@macbook.be.48ers.dk>
	<1253651876.451.40.camel@station1.ormlab.com>
Message-ID: <87r5tyu2iu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ormund" == Ormund Williams <ormundw@panix.com> writes:

Hi,

 >> I'm also unable to access it from here (Belgium). The directfb
 >> package in buildroot should still work though, as it falls back to
 >> the mirror on buildroot.net.
 >> 
 Ormund> Buildroot.net also fails:

Ah yes, I didn't get to update the mirror after we bumped the Directfb
version on the 3rd. You could perhaps use version 1.4.1 instead (edit
DIRECTFB_VERSION in package/directfb/directfb.mk)

-- 
Bye, Peter Korsgaard
