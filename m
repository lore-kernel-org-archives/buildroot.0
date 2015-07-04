From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jul 2015 20:26:06 +0200
Subject: [Buildroot] [PATCH] system: allow/disallow root login,
 accept encoded passwords
In-Reply-To: <20150704140819.207a544f@free-electrons.com>
References: <1435867205-27764-1-git-send-email-yann.morin.1998@free.fr>
 <20150704140819.207a544f@free-electrons.com>
Message-ID: <20150704182605.GB3634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-04 14:08 +0200, Thomas Petazzoni spake thusly:
> On Thu,  2 Jul 2015 22:00:05 +0200, Yann E. MORIN wrote:
> > From: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>
> > 
> > Currently, there are only two possibilities regarding the root account:
> >   - it is enabled with no password (the default)
> >   - it is enabled, using a clear-text, user-provided password
> > 
> > This is deemed insufficient in many cases, especially when the .config
> > file has to be published (e.g. for the GPL compliance, or any other
> > reason.).
> > 
> > Fix that in two ways:
[--SNIP--]
> Applied, thanks. This is typically the kind of patch for which if we
> had a test infrastructure in place, I would request to have some
> additional tests in the test infra.

Yes, sure.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
