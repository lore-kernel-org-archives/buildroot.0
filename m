From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 23:25:22 +0200
Subject: [Buildroot] [RFC v4 00/16]  Add per-package staging feature
In-Reply-To: <20150628230002.608893c0@free-electrons.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <20150628204622.GE3950@free.fr>
 <20150628230002.608893c0@free-electrons.com>
Message-ID: <20150628212522.GH3950@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fabio, All,

On 2015-06-28 23:00 +0200, Thomas Petazzoni spake thusly:
> On Sun, 28 Jun 2015 22:46:22 +0200, Yann E. MORIN wrote:
> > So, I'm really a bit skeptical. About five time the size for only about
> > twice the speedup, is it worth it? Sure some people will easily favour
> > speed over anything else, still the size overhead is really huge.
> 
> Do you reconsider this comment now that you know the reality about the
> size impact ? :-)

Hehe! ;-)

Of course, ~5% size overhead for 2+ times the speedup is totally
acceptable.

> > Otherwise, I have a 2x4 core Xeon @3.4GHz with three SSDs in RAID0 which
> > might be better as a HW_HIGH system. I can spin a test-build with this
> > patchset on this machine to see what we get...
> 
> Would definitely be useful. Maybe Fabio can provide you his
> defconfig-full test case (he gave the defconfig-small case).

Fabio, if you could share your two defconfig (or .config) files, that'd
be great!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
