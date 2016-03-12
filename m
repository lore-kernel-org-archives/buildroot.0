From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Mar 2016 23:58:38 +0100
Subject: [Buildroot] Autobuilder update
In-Reply-To: <20160310234742.3df6dff2@free-electrons.com>
References: <20160310234742.3df6dff2@free-electrons.com>
Message-ID: <20160312225838.GL3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-10 23:47 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> Some autobuilder updates:
> 
>  - All the Buildroot pre-built external toolchains have been rebuilt
>    with Buildroot 2016.02 + a few patches. To see which patches I'm
>    using to build those external toolchains, see the branch at:
> 
>    http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=br-ext-toolchain-fixes
> 
>  - The br-sh4-full configuration has been changed to actually use the
>    Buildroot toolchain, and not the pre-built Musl-cross toolchain.
> 
>  - I've fixed the Free Electrons build server, which was no longer
>    building anything since quite some time, due to a lack of disk
>    space. This will help re-increase the number of builds done each day.

I updated my instance yesterday evening. Thanks! :-)

Regards,
Yann E. MORIN.

> Let me know if there are other things that should be improved/changed
> in the autobuilder setup (be it adding more toolchain configurations,
> or other changes).
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
