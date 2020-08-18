From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:27:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: xvmc needs x11
In-Reply-To: <20200802121037.1200692-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 2 Aug 2020 14:10:37 +0200")
References: <20200802121037.1200692-1-bernd.kuhls@t-online.de>
Message-ID: <87eeo40yb5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > This is a follow-up patch to
 > https://git.buildroot.net/buildroot/commit/package/mesa3d?id=e79ee3b0f91aa3eb1b20d86701a195e3bd9a26d3

 > to make sure that MESA3D_PLATFORMS contains x11 needed by xvmc:
 > https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=20.1#n510

 > Fixes
 > http://autobuild.buildroot.net/results/dae/dae41e30d2ac69b768ec0a5b795a2e559c35bcd3/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
