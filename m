From: Xianghua Xiao <xiaoxianghua@gmail.com>
Date: Wed, 27 Apr 2011 07:44:16 -0500
Subject: [Buildroot] devmem2
In-Reply-To: <87tydkz2iy.fsf@macbook.be.48ers.dk>
References: <1303869098.2489.67.camel@kenm-i7>
	<129278.98526.qm@web161414.mail.bf1.yahoo.com>
	<BANLkTinUVfnoMGL2jySY4h7XOpN=Gkc2dA@mail.gmail.com>
	<87tydkz2iy.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTikTk2Q0FhXFFXKvYi9=Edd-GDE-QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think it's the BR2_DEPRECATED flag that caused me sending out the
first email, as I somehow think it should be kept and not to be
deprecated, it's handy, useful and small.

Xianghua

On Wed, Apr 27, 2011 at 12:28 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Xianghua" == Xianghua Xiao <xiaoxianghua@gmail.com> writes:
>
> ?Xianghua> why not keep devmem2 as an option but disable it by default,
> ?Xianghua> it's tiny anyway and essential for embedded devel.
>
> That's how it is today - Busybox devmem applet is enabled in the default
> busybox config, and we have a devmem2 package that is only visible when
> you enable BR2_DEPRECATED.
>
> --
> Bye, Peter Korsgaard
>
