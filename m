From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 13:33:53 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
In-Reply-To: <4746CCAD.4030909@promwad.com> (Ivan Kuten's message of "Fri\,
	23 Nov 2007 14\:50\:53 +0200")
References: <20071123114301.6B7493004A@busybox.net>
	<4746CCAD.4030909@promwad.com>
Message-ID: <87fxyxdtu6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ivan" == Ivan Kuten <ivan.kuten@promwad.com> writes:

Hi,

 Ivan> Are you sure that you need to remove $(TARGET_DIR)/usr/lib/pkgconfig
 Ivan> there could be other *.pc as well?

That shouldn't happend, and as we don't support pkgconfig on the
target it wouldn't be of any use anyway.

-- 
Bye, Peter Korsgaard
