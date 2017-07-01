From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 1 Jul 2017 18:34:32 +0200
Subject: [Buildroot] [PATCH] qt5multimedia: conditionally add pulseaudio
	to dependencies
In-Reply-To: <1498486306-29649-1-git-send-email-brgl@bgdev.pl>
References: <1498486306-29649-1-git-send-email-brgl@bgdev.pl>
Message-ID: <CAMRc=Mf4D-yqefgSnRv0eHXJ0Aw8rC-TWmxoDCYfx6Yp4Cn8hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-06-26 16:11 GMT+02:00 Bartosz Golaszewski <brgl@bgdev.pl>:
> Qt5Multimedia includes support for pulseaudio if it detects libpulse
> and libpulse-mainloop-glib in the system at build-time. We need to
> depend on pulseaudio if it is selected.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/qt5/qt5multimedia/qt5multimedia.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Superseded by v2 [1].

Thanks,
Bartosz
