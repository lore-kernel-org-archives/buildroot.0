From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 00:24:08 +0100
Subject: [Buildroot] [PATCH v6 3/6] *.mk: replace (TARGET|HOST)_PATH by
 BR_PATH
In-Reply-To: <20140309230502.GD3194@free.fr>
References: <1394373623-10650-1-git-send-email-s.martin49@gmail.com>
 <1394373623-10650-4-git-send-email-s.martin49@gmail.com>
 <20140309230502.GD3194@free.fr>
Message-ID: <20140309232408.GH3194@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-10 00:05 +0100, Yann E. MORIN spake thusly:
> On 2014-03-09 15:00 +0100, Samuel Martin spake thusly:
> > Thanks to the 2 previous patches of the series, BR_PATH contains
> > all locations in which host-packages may install programs.
> > 
> > This patch replaces the occurrences TARGET_PATH and HOST_PATH with
> > BR_PATH, everywhere these variables are used in the *.mk files.
> > 
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [--SNIP--]
> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> > index 512ef66..b0e4bd3 100644
> > --- a/package/pkg-python.mk
> > +++ b/package/pkg-python.mk
> > @@ -22,7 +22,7 @@
> >  
> >  # Target distutils-based packages
> >  PKG_PYTHON_DISTUTILS_ENV = \
> > -	PATH="$(TARGET_PATH)" \
> > +	PATH="$(BR_PATH)" \
> 
> Don't you lareday have quotes in the definitions of BR_PATH.

s/lareday/already/

Time to go to bed, I guess... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
