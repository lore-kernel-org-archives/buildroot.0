From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Dec 2012 19:10:25 +0100
Subject: [Buildroot] [PATCH 03/51] package/dtc: add option to install
	programs
In-Reply-To: <20121129094031.3173b9a0@skate>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-4-git-send-email-yann.morin.1998@free.fr>
 <20121129094031.3173b9a0@skate>
Message-ID: <201212031910.25754.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 29 November 2012 Thomas Petazzoni wrote:
> On Thu, 29 Nov 2012 00:54:02 +0100, Yann E. MORIN wrote:
> > There is some (minor?) issues wrt the licensing terms.
> > The libfdt library is dual-licensed GPLv2+/BSD-2c, and the
> > executables are licensed GPLv2+.
> > 
> > There is no way in BR to properly convey this information.
> > So I decided to add some explanatory comments in the .mk
> > file, in retaliation. ;-)
> 
> As per the discussion during the Developers Days, there is now a way to
> convey this information. From the report:
> 
>      multiple licenses: we don't want to make things very complex. It
>      doesn't have to be machine-readable (we don't need to support
>      machine analysis of the license field), so we don't have to
>      formally decide how the license text must be written. It does make
>      sense to have some convention, though. Proposal: "GPLv2+ or BSD-2c
>      for the library, GPLv2+ for the dtc executable". 

Right-o-right, I forgot that. Thanks for reminding me. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
