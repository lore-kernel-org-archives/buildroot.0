From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Mon, 18 Jun 2012 09:02:14 -0400
Subject: [Buildroot] Has anybody got systemd to work?
In-Reply-To: <4FDF24E2.6020603@free-electrons.com>
References: <CADiAo4JeiZT7foLgagzuO+Xjb6uFX-TFms_+e0TcuF4DBpcrcg@mail.gmail.com>
 <20120618091508.a0fd469d78e12fcca7fdf4c0@kinali.ch>
 <CADiAo4LRnawMEEYcES31KLQKBR7KSYi3wxE0=kt7Pc9aMq64EQ@mail.gmail.com>
 <4FDF24E2.6020603@free-electrons.com>
Message-ID: <CADiAo4+pdmOUG0LZkLHaDXs5odjxNGU3MzbP5=iGpW2pTRJNvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime,

On Mon, Jun 18, 2012 at 8:53 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> Anyway, if it is only the %ms thing that is breaking systemd on uclibc,

This has been found so far ;)

> it shouldn't be such a big problem. Quickly grepping the systemd source
> code returns 17 occurences of such case, so a patch is definitely doable.

Yes, I got the same.

> I won't have much time, do you mind doing so and sending us the patch so
> that it could get included ?

Yes, I am going to work on this, and will provide the patch once I have it.

I cannot promise exactly when ;)

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
