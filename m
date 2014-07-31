From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Aug 2014 00:05:21 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/patchelf: new host package
In-Reply-To: <20140731235501.333bc892@free-electrons.com>
References: <cover.1406760999.git.yann.morin.1998@free.fr>
 <fc8f5090621f94da255a6191eec78125047eb318.1406760999.git.yann.morin.1998@free.fr>
 <20140731235501.333bc892@free-electrons.com>
Message-ID: <20140731220521.GR3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Samuel, All,

On 2014-07-31 23:55 +0200, Thomas Petazzoni spake thusly:
> On Thu, 31 Jul 2014 00:57:16 +0200, Yann E. MORIN wrote:
> > In some situations, users may want to tweak the dynamic section of the
> > binaries (for example to add/set the RPATH to $ORIGIN/../lib).
> > 
> > Because it is not trivial to do it properly from the Buildroot
> > infrastructure, allow those users to use patchelf (e.g. from a
> > post-build script) to tweak binaries.
[--SNIP--]
> > +PATCHELF_LICENSE = GPLv3
> The license is actually GPLv3+, see the README file of the project.
[--SNIP--]
> Other than that, applied, thanks!

Thanks! :-)

> I think it would be good to use that to make the toolchain relocatable,
> instead of something like http://patchwork.ozlabs.org/patch/359841/.
> What do you think?

I think that Samuel already has a WIP branch on making a relocatable
SDK: https://github.com/tSed/buildroot/tree/sma/reloc-sdk/wip

So, Samuel, what do you think of it? ;-)

(Note how fast I was able to elude and reassign the question?)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
