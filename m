From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 1 Dec 2012 23:06:43 -0200
Subject: [Buildroot] Qt library difference between E.so and just .so
In-Reply-To: <CADKZYYJFAKFs5KmSbcU7o=wkWi1_wOVc6MhgZrOdALgr_iva+A@mail.gmail.com>
References: <CADKZYYJFAKFs5KmSbcU7o=wkWi1_wOVc6MhgZrOdALgr_iva+A@mail.gmail.com>
Message-ID: <CAExDhvZF6ZwmdpdWdgcmPp-pHFHkKZtT9SFeS1fC9W1qekxmjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   I've been using Qt since 3.x and as far as I know there has never
been a libQtGuiE. I suppose TI added that E suffix in their SDK. You
could create a symlink pointing to libQtGui.so, the worst thing that
can happen is the example just not execute. Or just rebuild the
example ;)

Kind Regards,
    Thiago A. Correa
