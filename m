From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 15:06:50 +0200
Subject: [Buildroot] [PATCH 01/24 v4] arch: add an option to specify if
 the	arch has atomic ops
In-Reply-To: <20140817145732.71eafc75@free-electrons.com>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
 <7d72fe60f396407b4fbc68ba8f9910cda0fe24a8.1408279142.git.yann.morin.1998@free.fr>
 <bd3543da-f3d3-4236-be5a-d6c85e8305ce@email.android.com>
 <20140817145732.71eafc75@free-electrons.com>
Message-ID: <20140817130650.GD5274@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-08-17 14:57 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Aug 2014 14:55:06 +0200, Thomas De Schampheleire wrote:
> 
> > Is there a specific reason why the option is now
> >  dubbed ATOMICS iso ATOMIC_INTRINSICS?
> > 
> > The latter may be a bit more descriptive, no?
> 
> But wouldn't make sense. "intrinsics" is a compiler notion, which
> doesn't have much to do with an architecture. An architecture provides
> atomic instructions, which in turn allow compilers to implement a
> certain class of compiler intrinsics to access those atomic operations.

That.

Plus, who could have resisted the 'atomics' pun? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
