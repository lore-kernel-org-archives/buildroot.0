From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Oct 2013 13:36:26 +0200
Subject: [Buildroot] Ncurses wide support
In-Reply-To: <CAAEAJfD_YaKXY5cMn9H7DcUe3fyJ8L7wJ+RkmaOy40D0KmSZtw@mail.gmail.com>
References: <CAAEAJfCkpC6-ZnpcxYCgTiZN8=QJNY+wZg83Jjyzs8-e7jPkkw@mail.gmail.com>
 <525D1693.3010509@zacarias.com.ar>
 <CAAEAJfD_YaKXY5cMn9H7DcUe3fyJ8L7wJ+RkmaOy40D0KmSZtw@mail.gmail.com>
Message-ID: <20131015133626.180de72d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garc?a,

On Tue, 15 Oct 2013 07:48:35 -0300, Ezequiel Garc?a wrote:

> Maybe you could explain this in detail? Or draft some ncurses.mk
> patch for me to take care of it?
> 
> I know you probably don't care about nano, but it's currently broken
> because of this ncursesw lack.

Not sure to follow the original problem. If nano needs ncursesw, why
don't you enable wchar support in your toolchain so that ncursesw gets
built?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
