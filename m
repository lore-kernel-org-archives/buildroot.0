From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Sep 2014 18:56:18 +0200
Subject: [Buildroot] [PATCH 17/23 v5] docs/manual: always look for
 ressources in destination directory
In-Reply-To: <CAAXf6LV8YgHWkg2t=z2sq=pHu+GAa65dAZK7QzTi66P0P3UZRw@mail.gmail.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <f1a0a2c203f426242b9c35172efec6aba4f3dd54.1410692670.git.yann.morin.1998@free.fr>
 <CAAXf6LXLLkjjky0LN5ZqpafPAnAHBci1Mzp_M4RSt=Dgrwha6w@mail.gmail.com>
 <20140925193116.GB4184@free.fr>
 <CAAXf6LV8YgHWkg2t=z2sq=pHu+GAa65dAZK7QzTi66P0P3UZRw@mail.gmail.com>
Message-ID: <20140926165618.GB4181@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-26 12:50 +0200, Thomas De Schampheleire spake thusly:
> On Thu, Sep 25, 2014 at 9:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > You mean, a comment in the .mk to explain why we pass -r $$(@D) ?
> 
> Yes. The fact that this extra -r is needed is not obvious at all. In
> fact, removing it would work fine for the manual. Only when you use
> the filters as you explain in the commit message is it really
> necessary.
> A comment would therefore avoid someone accidentally removing it
> because he/she thinks it's unneeded.

OK. Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
