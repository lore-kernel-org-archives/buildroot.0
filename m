From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2015 19:33:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/makedevs: add recursive option
In-Reply-To: <CA+TH9Vn8ojKvJBHT_PRJ==R_NHsqDbN6MVCfx+6NQ9P3UBcvmw@mail.gmail.com>
References: <1426243805-8317-1-git-send-email-angelo.compagnucci@gmail.com>
 <1426243805-8317-2-git-send-email-angelo.compagnucci@gmail.com>
 <20150409212331.GB4192@free.fr>
 <CA+TH9Vn8ojKvJBHT_PRJ==R_NHsqDbN6MVCfx+6NQ9P3UBcvmw@mail.gmail.com>
Message-ID: <20150410173352.GD4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2015-04-10 07:39 +0200, Angelo Compagnucci spake thusly:
> 2015-04-09 23:23 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > On 2015-03-13 11:50 +0100, Angelo Compagnucci spake thusly:
> >> This patch adds the possibilty to change owner/permission
> >> of a folder recursively.
> >>
> >> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> >
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > [I really only did a review and no actual tests]
> >
> > As a side comment: maybe that would be interesting to submit a similar
> > patch for busybox (where makedevs originated); note however that busybox
> > has changed quite a lot since we forked makedevs...
> 
> I've not submitted upstream cause the code for makedevs is in
> buildroot source tree ...
> If you think it's important, I will submit not later the patch will accepted.

Well, I won't say it is "important". It all really depends from the
perspective.

For one, I believe this is an interesting feature, from which busybox
could well benefit. So it makes sense to submit it to busybox. Of
course, this is not really correlated to our own makedevs, except by
ancestry.

So, if you have spare CPU cycles, please go ahead. If not, then no
problem. That was just a suggestion! ;-)

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
