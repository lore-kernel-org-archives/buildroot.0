From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2019 20:44:34 +0100
Subject: [Buildroot] [PATCH 18/19] core: ignore non-unique files that
 have disapeared
In-Reply-To: <CAAXf6LU+G8Sfk6vxwRQ9+FcHsReDThUi0-yQRGprSOdXD9KU4Q@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <56125b7d30e7ebfc8c455d7cfb4f29528503c0af.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LU+G8Sfk6vxwRQ9+FcHsReDThUi0-yQRGprSOdXD9KU4Q@mail.gmail.com>
Message-ID: <20190108194433.GB4022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2019-01-08 16:29 +0100, Thomas De Schampheleire spake thusly:
> El lun., 7 ene. 2019 a las 23:07, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
[--SNIP--]
> > +    parser.add_argument('-d', '--dir', metavar="DIR", required=True,
> > +                        help='Directory used as base (target/, staging/ or host/))')
> Like commented elsewhere, metavar should be unnecessary.

And as I said elsewhere, I tested and indeed the default for metavar is
already correct for our usecase, so I dropped it everywhere. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
