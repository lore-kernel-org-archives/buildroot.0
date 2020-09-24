From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 24 Sep 2020 20:28:27 +0200
Subject: [Buildroot] Toolchain issues on multiple architectures
References: <20200910120536.2431494d@windsurf.hq.k.grp>
 <CAKmqyKOSLH-VJc-72eyn=O_-nNwneb3Wqcm-Yb1qt6TzXdDS0g@mail.gmail.com>
 <20200911093009.68a115f9@windsurf.hq.k.grp>
 <CAKmqyKN4Ge5YWUtbU-XwBD2JbrJ-jMhSVMZVbE6wOsz+CUM1jA@mail.gmail.com>
 <20200924114204.7713bdfe@windsurf>
Message-ID: <b35v3hxkcg.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 24 Sep 2020 11:42:04 +0200 schrieb Thomas Petazzoni:

> Perhaps you tried on master and something fixed this on master after
> 2020.08 ?

Hi,

never tried to build specifically for risc-v before but being curious I 
tried to reproduce the problem and yes: 2020.08 fails, master works.

To fix the problem with 2020.08 please cherry-pick
https://git.buildroot.net/buildroot/commit/?id=a4889545aa

Regards, Bernd
