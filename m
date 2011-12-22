From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Dec 2011 12:31:30 +0100
Subject: [Buildroot] problem with ccache during valgrind compiling
In-Reply-To: <CALR4fEJ56pZnEureL7ir0yTPVu_MrDxj_T9Rj76tUNNBGRDG8g@mail.gmail.com>
References: <CAAfyv341H2aP2sMHJxBanOgMHHv+bOz1KNwVocqkL2UKiacquQ@mail.gmail.com>
 <CALR4fEJ56pZnEureL7ir0yTPVu_MrDxj_T9Rj76tUNNBGRDG8g@mail.gmail.com>
Message-ID: <20111222123130.1a7ddcaf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 22 Dec 2011 11:37:20 +0200,
Diego Iastrubni <diegoiast@gmail.com> a ?crit :

> Same here. Is it possible to disable ccache for a single package?

I have reproduced the issue and I think I have a fix. I'll send it soon.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
