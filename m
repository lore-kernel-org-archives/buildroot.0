From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Jul 2017 18:16:53 +0200
Subject: [Buildroot] [PATCH 2/4 v2] package/kvm-unit-tests: introduce
 _ARCH_SUPPORTS
In-Reply-To: <20170709180305.5146f312@windsurf>
References: <cover.1499522760.git.yann.morin.1998@free.fr>
 <0d5c040b902f29f870a4a941f1850d7c29e43144.1499522760.git.yann.morin.1998@free.fr>
 <b0102f89-d625-7b1a-074e-006c4bdebeaf@mind.be>
 <20170708163045.GD3867@scaer> <20170709180305.5146f312@windsurf>
Message-ID: <20170709161653.GE3196@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-09 18:03 +0200, Thomas Petazzoni spake thusly:
> On Sat, 8 Jul 2017 18:30:45 +0200, Yann E. MORIN wrote:
> > >  GCC is *not* an arch dependency, so this should just be  
> > Yet we already use similar construct in other packages, like [...]
[--SNIP--]
> > Arguaby, none of the above have a dependency on gcc, but some are on the
> > C library, and others are on toolchain features...
> 
> Yes, but see what I replied to Carlos about adding a
> BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS option, which would have encoded
> non-architecture dependencies.

And it looks like I agree as I addressed Arnout's comment in v3. ;-)

I was just pointing out that we are not entirely consistent with this
rule, as some packages have such non-arch dependencies in their
_ARCH_SUPPORT symbols.

I'll try to find some time to fix them. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
