From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2020 21:14:12 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: don't hang the build if there
 are no file lists
In-Reply-To: <CAAXf6LVu=fS+QwDhmS7+07aiycPjvy0Bd7-9Y9J5NX=fp8O1Rg@mail.gmail.com>
References: <20200312091530.287681-1-thomas.petazzoni@bootlin.com>
 <20200312091530.287681-2-thomas.petazzoni@bootlin.com>
 <CAAXf6LXzTLt-eUfG8zsVRB-LNfc_jo01R9bWKDzDPH6ZLtnFMg@mail.gmail.com>
 <20200317131405.487ce542@windsurf.home>
 <CAAXf6LVu=fS+QwDhmS7+07aiycPjvy0Bd7-9Y9J5NX=fp8O1Rg@mail.gmail.com>
Message-ID: <20200317201412.GN19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2020-03-17 14:58 +0100, Thomas De Schampheleire spake thusly:
> El mar., 17 mar. 2020 a las 13:14, Thomas Petazzoni
> (<thomas.petazzoni@bootlin.com>) escribi?:
> > You can send the entire series I'd say. If you have tested my patch,
> > add your Reviewed-by/Tested-by, so that I can apply my own patch as
> > well :-)
> Ok, I made the proposed changes, will run some further tests, and then
> send them.

Since this discussion did not seem to be about the first patch, I
applied it. I however marked this second patch as Changes Requested in
patchwork.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
