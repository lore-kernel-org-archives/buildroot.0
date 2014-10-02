From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Oct 2014 22:43:07 +0200
Subject: [Buildroot] qemu kvm
In-Reply-To: <294053671.117038602.1412282292148.JavaMail.root@zimbra9-e2.priv.proxad.net>
References: <294053671.117038602.1412282292148.JavaMail.root@zimbra9-e2.priv.proxad.net>
Message-ID: <20141002204307.GC19775@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane, All,

On 2014-10-02 22:38 +0200, St?phane ANCELOT spake thusly:
> Is it possible using buildroot to create a mini system that will launch
> a virtualized os ?

Yes.

See in the Buildroot source tree:
    board/qemu/

And the defconfig we have:
    make help |grep qemu

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
