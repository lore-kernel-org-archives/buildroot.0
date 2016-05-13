From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:44:44 +0200
Subject: [Buildroot] SDL2_ttf requires libpng12 but Buildroot installs
 libpng16
In-Reply-To: <CAGrGpJANYGqcDrpsP_YXp_UrUAr-HP7ONbykBrT713K+J1JisA@mail.gmail.com>
References: <CAGrGpJB1XFuZWdXS7rWeaA9E7N2yzde8JuSp_A8KjU2vD6h_VA@mail.gmail.com>
 <20160512234548.20d6cd28@free-electrons.com>
 <CAGrGpJANYGqcDrpsP_YXp_UrUAr-HP7ONbykBrT713K+J1JisA@mail.gmail.com>
Message-ID: <20160513224444.1d7cd914@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 14:39:23 -0600, Peter Thompson wrote:

> The  answer is that I was unaware of the Buildroot autotools capability.

Well, this is a bit hard to believe. Your work relies on the fact that
Buildroot builds SDL2, right?

And what is SDL2 using? The autotools. So surely, if you had taken a
look at package/sdl2/sdl2.mk, which is the Buildroot description of how
to build SDL2, you would have seen in a few minutes how an
autotools-based package is handled.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
