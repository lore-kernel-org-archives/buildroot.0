From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 16:35:12 +0100
Subject: [Buildroot] [git commit] package/libsigrok: drop remnants of
 autoreconf
In-Reply-To: <20200213221532.B8BF68E029@busybox.osuosl.org> (Peter Korsgaard's
 message of "Thu, 13 Feb 2020 23:24:50 +0100")
References: <20200213221532.B8BF68E029@busybox.osuosl.org>
Message-ID: <8736ac1d5b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7ba7b9603b686524e1981e5251e9e25f5034d1bc
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > libsigrok has not needed autoreconf since b428801934 (package/libsigrok:
 > bump version to 0.4.0), 4 years ago now.

 > As such, we no longer need the autoreconf options, nor the dependency on
 > the autoconf archive.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
