From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 19:21:26 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/smartmontools: fix build
 without stack-protector
In-Reply-To: <CAPi7W81Ykb+kRn1oG=VPVB7P-sAzM61nkuVCv=vBrJYiVnuMmQ@mail.gmail.com>
References: <20200223153638.1109360-1-fontaine.fabrice@gmail.com>
 <20200223165031.GQ8743@scaer>
 <CAPi7W81Ykb+kRn1oG=VPVB7P-sAzM61nkuVCv=vBrJYiVnuMmQ@mail.gmail.com>
Message-ID: <20200223182126.GR8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-23 18:25 +0100, Fabrice Fontaine spake thusly:
> Le dim. 23 f?vr. 2020 ? 17:50, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > On 2020-02-23 16:36 +0100, Fabrice Fontaine spake thusly:
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/0de9f2a69fa2a39164211299f8a429d2fec6935a
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > Applied to master, thanks.
> Patch was for next as stated in commit title, not for master (perhaps
> I should also have specified it in the commit message).

Arg, my bad sorry...


Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
