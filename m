From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Feb 2020 14:20:14 +0100
Subject: [Buildroot] [PATCH] package/util-linux: bump to version 2.35
In-Reply-To: <20200129173425.10988-1-unixmania@gmail.com> (unixmania's message
 of "Wed, 29 Jan 2020 14:34:25 -0300")
References: <20200129173425.10988-1-unixmania@gmail.com>
Message-ID: <874kw9p1m9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > This version brings bug fixes, enhancements and a new script utility,
 > scriptlive. For detailed information see the release notes:

 >   http://www.kernel.org/pub/linux/utils/util-linux/v2.35/v2.35-ReleaseNotes

 > Pull some fixed applied after the release.

 > Disable the use of code under GPLv3 included in hwclock since v2.30. The
 > subject was discussed upstream[1] and it was decided that hwclock will
 > be made GPLv2-only again in v2.36, so do it in advance in Buildroot.

 > Meanwhile, be warned that all OS images selecting hwclock built with
 > Buildroot since commit 74235a6854 (util-linux: bump to version 2.30)
 > contain code under GPLv3, which imposes some technical difficulties to
 > include in embedded systems. For more information see GPLv3, Section 6,
 > "Conveying Non-Source Forms", and the definitions of User Product and
 > Installation Information[2].

Argh :/

Committed, thanks. I will also apply it to 2019.02.x / 2019.11.x once I
sync them.

-- 
Bye, Peter Korsgaard
