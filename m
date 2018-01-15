From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 23:20:57 +0100
Subject: [Buildroot] [PATCH 1/4] package/mpv: fix build with libva 2.0
In-Reply-To: <20171218205609.17653-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 18 Dec 2017 21:56:06 +0100")
References: <20171218205609.17653-1-bernd.kuhls@t-online.de>
Message-ID: <87inc2sr06.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/mpv/0003-libva20.patch | 93 ++++++++++++++++++++++++++++++++++++++++++
 >  1 file changed, 93 insertions(+)
 >  create mode 100644 package/mpv/0003-libva20.patch

 > diff --git a/package/mpv/0003-libva20.patch b/package/mpv/0003-libva20.patch
 > new file mode 100644
 > index 0000000000..349dd3cb14
 > --- /dev/null
 > +++ b/package/mpv/0003-libva20.patch

We already have 0003-rpi-fix-linking-errors.patch, so I've renamed to
0004-libva20.patch and applied, thanks.

I see that mpv-0.28 (which includes this change) has been released, so
it might be worth bumping the version.

-- 
Bye, Peter Korsgaard
