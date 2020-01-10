From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 21:56:52 +0100
Subject: [Buildroot] Kconfig warnings with GCC9
In-Reply-To: <CAGt4E5su1GkK+5ghxC9x9G9KNizC-5jm5E58qPKkDXKuDu5CqQ@mail.gmail.com>
References: <CAGt4E5su1GkK+5ghxC9x9G9KNizC-5jm5E58qPKkDXKuDu5CqQ@mail.gmail.com>
Message-ID: <20200110215652.291df299@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jan 2020 11:17:47 -0800
Markus Mayer <mmayer@broadcom.com> wrote:

> Hi all,
> 
> Using GCC9 (Ubuntu 19.10), I am getting some compiler warnings
> (potential buffer overruns) in the Kconfig code. Is this a known
> issue?

You can try to update the kconfig code in Buildroot with the kconfig
code available from the latest kernel, and see if it fixes the
warnings. We're currently using the kconfig code from 4.17-rc2 it seems.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
