From: Anders Darander <anders.darander@gmail.com>
Date: Tue, 22 Dec 2009 11:50:22 +0100
Subject: [Buildroot] BR + CT-NG integration
In-Reply-To: <4B308D19.1040107@anciens.enib.fr>
References: <200912212351.11487.yann.morin.1998@anciens.enib.fr>
	<2c9a759f0912220031q1e1c0063ja28c1072d377ce84@mail.gmail.com>
	<4B308D19.1040107@anciens.enib.fr>
Message-ID: <2c9a759f0912220250r8293b24ie81edda74863ee2a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann and all!

On Tue, Dec 22, 2009 at 10:10, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> I guess there will need to be more work in that area, as CT-NG also provides
> a few other "debug" utilities that are also currently handled by buildroot.

Yes, that is certainly true.
Ultimately, I think that it should be possible to choose which debug
tools are to be installed onto the target. (As it's not always the
case that you have got enough space for everything on the target).
Yet, you might like to build everything with crosstool-NG, to not have
to rebuild the toolcain.

To be able to use crosstool-NG outside of buildroot, I'd like
crosstool-NG to retain building all debug tools that you currently are
building. In such a way, I'm assured (to some extent) that I'm not
mixing incompatible versions.

I'm aware that having the installation of all debug tools as separate
option, will create quite a few extra options; possibly not making it
easier for the newcomers. OTOH, I really think that this would be
useful.
I can think of a few ways this could enhance and extend my previosly
mentioned patch for gdbserver.

Keep up the good work!

Regards,
Anders Darander
