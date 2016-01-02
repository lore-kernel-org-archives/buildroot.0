From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2016 11:28:19 +0100
Subject: [Buildroot] [PATCH 24/84 RFC] package/php: use 'menuconfig'
 instad of 'config'+'menu'
In-Reply-To: <56871E59.4090803@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <7f07ff3547359b272d229ebd4ca3740b7c6eff84.1451076704.git.yann.morin.1998@free.fr>
 <56871E59.4090803@mind.be>
Message-ID: <20160102102819.GB3477@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-01-02 01:48 +0100, Arnout Vandecappelle spake thusly:
> On 25-12-15 22:24, Yann E. MORIN wrote:
> > Move the external extensions selection into the bundled extensions'
> > Config.in.
> > 
> > Make the menu prompt a comment, reword it so that it is more in line
> > with the following comments.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  I still think it looks really weird that you have XSL and then php-geoip.

Well, it looks a bit different, indeed. But I think it is a good thing,
since they are external extensions and thus stand out in the list.

> Perhaps we should consider letting go of the rule that the prompt should be the
> exact package name, and instead make it plain geoip. But that's more churn...

By 'the exact package name', did you mean 'the way we named it in
Buildroot' or 'the way upstream named it' ?  Speaking about 'package'
can quickly get really confusing! ;-)

However, I think we should really use the way upstream names it,
whatever we call it in Buildroot.

But s you said, it's more churn, and we can work on it later. If needed.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
