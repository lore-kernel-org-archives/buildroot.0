From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Jan 2016 19:40:22 +0100
Subject: [Buildroot] Qwt package dependencies
In-Reply-To: <569FC780.7050104@yahoo.fr>
References: <569FC780.7050104@yahoo.fr>
Message-ID: <20160120184022.GA3992@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2016-01-20 18:44 +0100, David Picard spake thusly:
> I noticed that the Qwt package (BR2_PACKAGE_QWT) depends on Qt 4.8
> (BR2_PACKAGE_QT). But I have installed and tested Qt 5.5 already, and plan
> to develop Qt5/Qwt apps.
> 
> Do I have to install Qt 4 too just to satisfy the dependencies ? Can I tweak
> some file like package/qwt/Config.in ?

At the time Qwt was packaged in Buildroot, we did not have Qt5 yet, so
the dependency was naturally on Qt (i.e. Qt4).

Time has passed, and no one seemed interested in Qwt with Qt5 as we
still have a Qwt package that only depends on Qt4.

I checked on Qwt's homepage,and they do claim Qt5 comaptibility.

So, you are welcome to provide a patch that changes the Qwt dependencies
to also include Qt5! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
