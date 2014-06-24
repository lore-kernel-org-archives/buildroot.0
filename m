From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 23:59:54 +0200
Subject: [Buildroot] [PATCH 07/54] libevent: add license information
In-Reply-To: <53A9F385.9020703@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-7-git-send-email-gustavo@zacarias.com.ar>
 <20140624214940.GF31767@free.fr> <53A9F385.9020703@zacarias.com.ar>
Message-ID: <20140624215954.GJ31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 18:54 -0300, Gustavo Zacarias spake thusly:
> On 06/24/2014 06:49 PM, Yann E. MORIN wrote:
> 
> > The LICENSE file refer to at least those three licenses:
> >   - the BSD-3c license
> >   - the "OpenBSD" license
> >   - the MIT license
> 
> Quote from line 31 of LICENSE:
> 
> Portions of Libevent are based on works by others, also made available
> by them under the three-clause BSD license above.  The copyright notices
> are available in the corresponding source files; the license is as above....
> 
> So BSD-3c as well.

To be sure we're looking at the same file:
    https://github.com/libevent/libevent/blob/master/LICENSE

Look at lines 57:
    The arc4module is available under the following, sometimes called
    the "OpenBSD" license: [...]

And line 77:
    The Windows timer code is based on code from libutp, which is
    distributed under this license, sometimes called the "MIT" license.

Those two are properly separated from the others with a prominent line
of '=', so to me it clearly indicates the above license does apply to
neither arc4module nor the Windows timer code.

So, I stand by my comment. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
