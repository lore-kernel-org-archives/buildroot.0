From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Oct 2020 22:59:45 +0200
Subject: [Buildroot] [PATCH v2] package/dvb-apps: fix build failure with
 glibc 2.31
In-Reply-To: <20201015231202.71346d5e@windsurf>
References: <20200926170920.716-1-daggs@gmx.com>
 <20201015231202.71346d5e@windsurf>
Message-ID: <20201016205945.GE3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-10-15 23:12 +0200, Thomas Petazzoni spake thusly:
> On Sat, 26 Sep 2020 20:09:20 +0300
> > dvb-apps fails to build with glibc 2.31 with the following error:
> > Fixes:
> > http://autobuild.buildroot.net/results/95f30c5e6af2274418bb44a20da7caac69f1dd68/
> Applied to master, thanks. I'm wondering: is dvb-apps still useful? It
> doesn't seem to really be maintained anywhere...

Last commit was on 2014-03-21, more than 6 years ago now. The project is
in the "Old projects not maintained anymore at LinuxTV.org" section of
linuxtv.org.

The homepage https://www.linuxtv.org/wiki/index.php/LinuxTV_dvb-apps has
not been updated since 2013-02-16.

It seems they have been replaced by a set of utilties in the v4l-utils
tree: https://git.linuxtv.org/v4l-utils.git/tree/utils at least
regarding the scanning utilities, and by a repository dedicated to
hosting the scnan tables: https://git.linuxtv.org/dtv-scan-tables.git/

dvb-apps still has a few utilities that are not avilable elsewhere, like
dvbdate, to set the clock from the DTV signal, for example.

TBH, I lost most interest in these DTV-related packages since the time I
added them, 6 to 8 years ago now, and I no longer use them anymore, so I
am not really sure how they relate to each other now...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
