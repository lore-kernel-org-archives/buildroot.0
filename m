From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Jan 2015 18:42:29 +0100
Subject: [Buildroot] [PATCH 10/11 v5] package/nvidia-tegra23-binaries:
	provides JPEG
In-Reply-To: <20150120180514.1dd4c6e0@nserafini-N550JK>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
 <efaa3cd8c1b9caf8702e9a79748647e8abaf7c14.1421699898.git.yann.morin.1998@free.fr>
 <20150120180514.1dd4c6e0@nserafini-N550JK>
Message-ID: <20150121174229.GF4375@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2015-01-20 18:05 +0100, Nicolas Serafini spake thusly:
> I'm not able to build a package that has dependency on libjpeg because
> headers are missing.

Ah, that's unfortuante, and I did not think about it (I just split your
existing patch).

> The Nvidia documentation doesn't not provide any information on this
> binary version of libjpeg so for me we have two choice.
> 
> The first is to add a patch that provide headers and the second is to
> simply remove this patch.
> It's possible to use accelerated jpeg using jpeg-turbo and the BSP I
> was using before simply drop this binary version of libjpeg.

Well, let's see what headers we must provide, and how big or specific
they might be. If we can not find a satisfactory jpeg header, then yes,
we'll have to drop that patch...

I'll have a look, thanks for the reports! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
