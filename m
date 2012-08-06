From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Aug 2012 18:58:05 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.16.0
In-Reply-To: <20120805232656.4b952d9a@skate>
References: <1344197156-20586-1-git-send-email-yann.morin.1998@free.fr>
 <201208052248.32983.yann.morin.1998@free.fr> <20120805232656.4b952d9a@skate>
Message-ID: <201208061858.05607.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 05 August 2012 23:26:56 Thomas Petazzoni wrote:
> Le Sun, 5 Aug 2012 22:48:32 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > Yes, it would be nice, but there's no provision in crosstool-NG to use a
> > defconfig file, except from the bundeled samples.
> 
> Well, then we can do just like we do for the kernel:
> 
> 	install -D crosstool-ng.config $(CROSSTOOL_NG_BUILD_DIR)/samples/buildroot/crosstool-ng.config
> 	ct-ng buildroot
> 	ct-ng build
> 
> And there you are :-)

I guess it is too late for this release cycle, and hopefully crosstool-NG
will gain such an ability t the next release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
