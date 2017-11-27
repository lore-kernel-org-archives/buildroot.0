From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 12:12:46 +0100
Subject: [Buildroot] [PATCHv2] package/hackrf: new package
In-Reply-To: <20171126175012.3e950dae@windsurf.home>
References: <20171126153550.13871-1-yann.morin.1998@free.fr>
 <20171126175012.3e950dae@windsurf.home>
Message-ID: <20171127111246.GC2950@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-26 17:50 +0100, Thomas Petazzoni spake thusly:
> On Sun, 26 Nov 2017 16:35:50 +0100, Yann E. MORIN wrote:
> >  package/Config.in                                  |  1 +
> >  ...01-host-tools-use-pkg-cnfig-to-find-fftwf.patch | 45 ++++++++++++++++++++++
> >  package/hackrf/Config.in                           | 17 ++++++++
> >  package/hackrf/hackrf.mk                           | 22 +++++++++++
> >  4 files changed, 85 insertions(+)
> 
> Update to the DEVELOPERS file is missing.

Fixed, thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
