From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Feb 2015 08:09:31 +0100
Subject: [Buildroot] glibc and locale
In-Reply-To: <54D7F4F8.3040005@ou.edu>
References: <54D7F4F8.3040005@ou.edu>
Message-ID: <20150209080931.147fac1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Sun, 08 Feb 2015 17:44:56 -0600, Steve Kenton wrote:
> I have a script that wants the locale program. I notice that is is already built
> as part of the glibc build process, but it is not installed. Would there be
> any objections to something along these lines to go ahead and install locale?
> I'm not sure if this is the best way since glibc build uses autotools.

This looks ok, but I am wondering how that would be done with the
uClibc and musl C libraries. Remember that we support three different C
libraries, so when we're doing a change to one of them, we always need
to check what needs to be done for the two other ones.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
