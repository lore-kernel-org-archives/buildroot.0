From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 00:49:01 +0200
Subject: [Buildroot] [PATCH 10/11 RFC] support/scripts: generate a list
 of virtual packages
In-Reply-To: <20140531224407.GI3522@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
 <9b38d186ea4f2dcf6572add7998fda0fd68cd06a.1401395407.git.yann.morin.1998@free.fr>
 <CAHXCMM+gNM8XqdRYZtFVBXoYyYhK3_0fnk6zdz1zO50gaRih8A@mail.gmail.com>
 <20140531224407.GI3522@free.fr>
Message-ID: <20140531224900.GK3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-06-01 00:44 +0200, Yann E. MORIN spake thusly:
> On 2014-05-31 23:25 +0200, Samuel Martin spake thusly:
> > In these 2 above sub-functions, you can replace br by self, so drop
> > the br argument
> 
> Does not work:
>     TypeError: _get_providers() takes exactly 2 arguments (3 given)
> 
> Do I need to call it from self?
>     providers.extend(self._get_providers(config,sym))

Forget it, I missed changing one of the callers... Works now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
