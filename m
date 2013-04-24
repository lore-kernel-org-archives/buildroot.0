From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Apr 2013 23:19:55 +0200
Subject: [Buildroot] [PATCH 5/7] arc: Add support for ARC-specific GCC
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D6339FA09B@de02wembxa.internal.synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-6-git-send-email-mjonker@synopsys.com>
 <20130422175605.135d02f5@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FA04F@de02wembxa.internal.synopsys.com>
 <20130424162751.6500c3df@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FA09B@de02wembxa.internal.synopsys.com>
Message-ID: <20130424211955.GB24710@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mischa, All,

On Wed, Apr 24, 2013 at 03:19:14PM +0000, Mischa Jonker wrote:
> There are some patches with your name on it in support/gnuconfig/patches. 
> These patches seem to be applied already on support/gnuconfig/*. I have 
> updated these patches so that they apply cleanly on top of the new gnuconfig
> (+small ARC-specific addition), but they still have your Signed-off-by tag. 
> 
> What's the proper procedure for signing off patches within a patch? 

Two options:
  - update the patch, add your SoB-line
  - add a new patch with only your SoB-line

If your change adds a new semantic change (which is the case: add a new
architecture), then I'd favour the second option.

If your change is an addition (as a fix, or for completeness), then go
for option 1.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
