From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 28 Sep 2011 12:05:15 +0200
Subject: [Buildroot] Build a single package with -j1
In-Reply-To: <CANdC7UHvpjbqS0uvuUXURjYGBAe+TajZZOGi5zmCqXbHpthndA@mail.gmail.com>
References: <CANdC7UHvpjbqS0uvuUXURjYGBAe+TajZZOGi5zmCqXbHpthndA@mail.gmail.com>
Message-ID: <CAEYzJUEtPAAS6mhv3WW9EsLqP3UVNO9pHkEcdMUG+SgOGOYT-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 September 2011 11:31, Allan Nielsen <a@awn.dk> wrote:
> Hi
>
> Is it possible to specify that a single package must be build in one thread
> only?

Yes.

LIBFOO_MAKE=$(MAKE1)

It's documented here: http://buildroot.uclibc.org/buildroot.html

Best regards,
Bj?rn Forsman
