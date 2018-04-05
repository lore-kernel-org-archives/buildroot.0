From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Apr 2018 22:47:00 +0200
Subject: [Buildroot] [PATCH 01/23] support/config-fragments/autobuild:
 remove Blackfin configuration
In-Reply-To: <20180405223823.37e9e07a@windsurf>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
 <20180405195037.32641-2-thomas.petazzoni@bootlin.com>
 <20180405202933.GB22364@scaer> <20180405223823.37e9e07a@windsurf>
Message-ID: <20180405204700.GD22364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-05 22:38 +0200, Thomas Petazzoni spake thusly:
> On Thu, 5 Apr 2018 22:29:33 +0200, Yann E. MORIN wrote:
> 
> > > -# Test a noMMU toolchain with dynamic library support
> > > -support/config-fragments/autobuild/br-bfin-full.config,x86_64  
> > 
> > Do we plan on adding back another noMMU target with dynamic library
> > support instead of that one?
> 
> We don't have any other noMMU target that supports dynamic library
> support currently. FDPIC support on ARM is being worked on upstream,
> but I don't think it's ready yet.

ACK.

> Otherwise, there is FDPIC support for SH2, but we don't have support
> for this either.

Do we really want to revive that? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
