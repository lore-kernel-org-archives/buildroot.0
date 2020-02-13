From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 23:26:21 +0100
Subject: [Buildroot] [PATCH 1/3] package/libsigrok: drop remnants of
 autoreconf
In-Reply-To: <f3a6a36229cf2b73df2ea2f5ee0c092c601cf4ea.1581261155.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 9 Feb 2020 16:12:40 +0100")
References: <cover.1581261155.git.yann.morin.1998@free.fr>
 <f3a6a36229cf2b73df2ea2f5ee0c092c601cf4ea.1581261155.git.yann.morin.1998@free.fr>
Message-ID: <87mu9mceeq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libsigrok has not needed autoreconf since b428801934 (package/libsigrok:
 > bump version to 0.4.0), 4 years ago now.

 > As such, we no longer need the autoreconf options, nor the dependency on
 > the autoconf archive.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
