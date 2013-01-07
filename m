From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 22:52:23 +0100
Subject: [Buildroot] [PATCH v2 1/6] sg3_utils: new package
In-Reply-To: <CAAfyv36e2Yk2kHFAq+p_BOpdz56Wa6qQaBW4zYJrq=4bnUf01Q@mail.gmail.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-2-git-send-email-marek.belisko@open-nandra.com>
 <20130107222615.36bd70ab@skate>
 <CAAfyv36e2Yk2kHFAq+p_BOpdz56Wa6qQaBW4zYJrq=4bnUf01Q@mail.gmail.com>
Message-ID: <20130107225223.10cdf4e6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Belisko Marek,

On Mon, 7 Jan 2013 22:45:50 +0100, Belisko Marek wrote:

> > You should be work specific than just BSD and GPL. Like BSD-3c or
> > BSD-4c, GPLv2, GPLv2+, GPLv3, GPLv3+, etc.
> After proper reading of COPYING file it seems it GPLv2+
> "Some of the older utilities are covered by the GPL. More precisely:
> You are free to distribute this software under the terms of the
> GNU General Public License either version 2, or (at your option)
> any later version." but in same file there is no mention about BSD
> license version.

There is a BSD_LICENSE file that contains a BSD three clause license,
so I would say:

SG3_UTILS_LICENSE = GPLv2+ BSD-3c
SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
