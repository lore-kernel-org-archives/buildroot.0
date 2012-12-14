From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Dec 2012 19:28:33 +0100
Subject: [Buildroot] [PATCH 4/4] package/qemu: bump version
In-Reply-To: <CAB0FRsv7=iuBTxoeUe_7a5Zh_zCRovj9JZ_k_Qku-xmMGgOUeQ@mail.gmail.com>
References: <cover.1355434710.git.yann.morin.1998@free.fr>
 <b868ae7c3562ef5dd3b7027f28dc7f0ebba3b440.1355434710.git.yann.morin.1998@free.fr>
 <CAB0FRsv7=iuBTxoeUe_7a5Zh_zCRovj9JZ_k_Qku-xmMGgOUeQ@mail.gmail.com>
Message-ID: <201212141928.33454.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On Friday 14 December 2012 Fran?ois Perrad wrote:
> 2012/12/13 Yann E. MORIN <yann.morin.1998@free.fr>:
> > Bump QEMU to 1.2.1.
> >
> > Note: 1.3.0 is out now, but ./configure has changed a bit, and there are
> > new dependencies, so the bump to 1.3.0 is postponed for a litle while...
> >
> 
> a version 1.2.2 is also available.

Ah, 1.2.2 has just been released two days ago, indeed.
Thanks for the heads up.

> with version 1.3.0, host-qemu depends on host-pixman.

Yep, upgrading to 1.3.0 is on my todo-list, as it adds a few bits I'm
interested in.

Upgrading to 1.3.0 now would make it more complex to review the whole
series, and it is not even easy right now.

So, that will have to wait for after the current series has been upstreamed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
