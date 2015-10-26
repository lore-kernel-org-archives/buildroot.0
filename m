From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Oct 2015 19:00:29 +0100
Subject: [Buildroot] [PATCH 1/2] x265: new package
In-Reply-To: <CAHCOiUSFUs4Nnr_r99LhkvOwS9HGZ19UPiGd0mwQAZadQDzLfA@mail.gmail.com>
References: <1445716229-40660-1-git-send-email-thijsvermeir@gmail.com>
 <87d1w2fxgq.fsf@dell.be.48ers.dk> <20151025214020.GL11692@free.fr>
 <CAHCOiUSFUs4Nnr_r99LhkvOwS9HGZ19UPiGd0mwQAZadQDzLfA@mail.gmail.com>
Message-ID: <20151026180029.GA3788@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thijs, All,

On 2015-10-26 13:53 +0100, Thijs Vermeir spake thusly:
> On Sun, Oct 25, 2015 at 10:40 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Thijs, care to check if changing true/false to ON/OFF still works,
> > please? If so, can you send an patch? This way, all our Cmake-based
> > packages will look the same, which is good for consistency.
> >
> > Regards,
> > Yann E. MORIN.
> 
> Yes, I can look at it. To be clear you mean by the "standard" way:
> - create a patch to accept BUILD_SHARED_LIBS (and enable fPIC) and
> remove all the shared lib stuff from the mk file

No, it should not be needed to patch the sources of the package.

Just check if changing true/false in x265.mk to ON/OFF still works. If
so, do the change and send a patch to Buildroot to use ON/OFF instead of
true/false.

If it does not work, we will keep true/false.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
