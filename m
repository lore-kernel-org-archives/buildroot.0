From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Sep 2016 16:15:30 +0200
Subject: [Buildroot] [PATCH 4/4 v2] manual: get rid of the lists of
 packages
In-Reply-To: <20160904152039.1c00e023@free-electrons.com>
References: <cover.1472943074.git.yann.morin.1998@free.fr>
 <206a0e9bf7a1e99fa176fe1345d245881f14b858.1472943074.git.yann.morin.1998@free.fr>
 <20160904152039.1c00e023@free-electrons.com>
Message-ID: <20160904141530.GA6522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-09-04 15:20 +0200, Thomas Petazzoni spake thusly:
> On Sun,  4 Sep 2016 00:58:43 +0200, Yann E. MORIN wrote:
> 
> > Those list take more than half of the manual. They do not serve much
> > purpose except to show off. The only one that is interesting is the list
> > of virtual packages, the associated symbols and their providers.
> 
> I would like to challenge the fact that the list of virtual packages is
> more useful than the rest of the list.
> 
> virtual packages are purely internal things, you only need to know
> about virtual packages when you're adding new packages in Buildroot.
> And when you're adding new packages in Buildroot, you have far enough
> experience to do a "git grep virtual-package" and find which ones are
> available.

Of course, I do not agree! ;-)

But do I care enough to argue? Certainly not. I tend to be less
interested in making things easy/easier for the users nowadays... :-/

I'll send an updated patch that removes all the lists altogether.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
