From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 19:22:42 +0200
Subject: [Buildroot] [PATCH 9/9] package/weston: add option to enable EGL
In-Reply-To: <20131010090746.51e21c34@skate>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
 <7e31b6ba4a2f05ab5ba1b1114863e7d102fa5a17.1381354867.git.yann.morin.1998@free.fr>
 <20131010090746.51e21c34@skate>
Message-ID: <20131010172242.GB3230@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-10-10 09:07 +0200, Thomas Petazzoni spake thusly:
> On Wed,  9 Oct 2013 23:44:25 +0200, Yann E. MORIN wrote:
> > +# Whether EGL support is needed
> > +config BR2_PACKAGE_WESTON_EGL
> > +    bool
> 
> Indentation should be done with a tab.

Doh, serves me for using a 4-space tab by default here... :-/
Will fix.

> That said, I'm unsure about this patch: do we really want to add "dead"
> code, that isn't being used for the moment? Shouldn't this wait for the
> first EGL-based compositor to be added?

I had this in my tree, so I just thought about sending it now. That's
good since I got early review on it! ;-)

I don't mind keeping it locally until we use it, indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
