From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Nov 2012 19:09:55 +0100
Subject: [Buildroot] Buildroot for avr32
In-Reply-To: <CAExDhvZUT2KpJfuxqg__y=PqpLYQsHXaSEa6s1Ni61UW6D4skQ@mail.gmail.com>
References: <memo.20121129102031.4232H@postmaster+dexdyne.com.cix.co.uk>
 <20121129113710.63d5676c@skate>
 <CAHt8ZCN5eB8shsxz+gVz6neYbwVC7kE-O=cT66MCTRQNq6o_qQ@mail.gmail.com>
 <20121129162848.5a761c63@skate>
 <CAHt8ZCO6Be2V+qPZ6Lu5y8kMaKipt2J=JgbbU7ZHqRXSF0c=tg@mail.gmail.com>
 <CAExDhvZUT2KpJfuxqg__y=PqpLYQsHXaSEa6s1Ni61UW6D4skQ@mail.gmail.com>
Message-ID: <20121129190955.416f2373@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thiago A. Corr?a,

On Thu, 29 Nov 2012 14:10:36 -0200, Thiago A. Corr?a wrote:

> I have bugged them in support ticket and even in public forum which
> they keep in avrfreaks.net before the EOL announcement.
> The answer was that they would after finishing porting their patches
> to gcc 3.4.x, but I guess they never did.

OpenWRT has gcc 4.4.7 patches and binutils 2.21.1 patches. I've tried
them, but unfortunately ld segfaults when linking uClibc. I'll do a
quick investigation, but I don't think I want to invest too much time
in this architecture...

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
