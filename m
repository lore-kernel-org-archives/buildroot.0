From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Dec 2011 15:04:22 +0100
Subject: [Buildroot] problem with ccache during valgrind compiling
In-Reply-To: <CAAfyv37svSYUTu4bE7236jmyG0=XLA=8Ty-eBrPJ02xqZt9=6g@mail.gmail.com>
References: <CAAfyv341H2aP2sMHJxBanOgMHHv+bOz1KNwVocqkL2UKiacquQ@mail.gmail.com>
 <20111230090615.1b93ee88@skate>
 <CAAfyv37svSYUTu4bE7236jmyG0=XLA=8Ty-eBrPJ02xqZt9=6g@mail.gmail.com>
Message-ID: <20111231150422.08bc29b7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 31 Dec 2011 13:12:34 +0100,
Belisko Marek <marek.belisko@gmail.com> a ?crit :

> I apply patch you sent and there is another problem:

Ah, yes, that's a mistake on my side. The patch
valgrind-3.7.0-readstab-fix.patch shouldn't have been part of the
commit. Can you just remove it and retry?

I will send a new updated version soon.

Thanks a lot for your testing!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
