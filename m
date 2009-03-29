From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Mar 2009 21:18:01 +0200
Subject: [Buildroot] svn commit: [25827] trunk/buildroot/package/automake
In-Reply-To: <87zlf8f1xr.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Thu\, 26 Mar 2009 21\:45\:36 +0100")
References: <20090326165522.5C989771F6@busybox.osuosl.org>
	<87tz5ggqup.fsf@macbook.be.48ers.dk> <20090326213421.55dae490@surf>
	<87zlf8f1xr.fsf@macbook.be.48ers.dk>
Message-ID: <87prg0dtp2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Peter> I think the best/simplest solution is to just copy the aclocal files
 Peter> of the cross tools (pkgconfig +auto*) from HOST_DIR to STAGING_DIR and
 Peter> point ACLOCAL_DIR to STAGING_DIR - I'll give it a test.

Ok, that seems to work. Simply make sure STAGING_DIR/usr/share/aclocal
gets created and copy over the pkgconfig + libtool .m4 files from
HOST_DIR to STAGING_DIR.

Committed as r25880.

-- 
Bye, Peter Korsgaard
