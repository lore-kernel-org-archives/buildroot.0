From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Nov 2014 22:16:56 +0100
Subject: [Buildroot] buildroot 2014.11-rc3 mono fails
In-Reply-To: <CA+TH9V=Y7vf6r1nWmYcK3exEyDP7W=5N-VtaUae9sWs-UB3ZJQ@mail.gmail.com>
References: <612310928.432121.1417205315374.JavaMail.open-xchange@oxbaltgw06.schlund.de>
 <CA+TH9V=Y7vf6r1nWmYcK3exEyDP7W=5N-VtaUae9sWs-UB3ZJQ@mail.gmail.com>
Message-ID: <20141128211656.GA4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2014-11-28 21:59 +0100, Angelo Compagnucci spake thusly:
> Probably you have a mono compiler installed on your machine and this
> mono compiler is not compatible with the latest mono version.
> 
> Mono uses the install wide mcs/gmcs compiler if it's present to
> compile itself,  also if not compatible.

Then that's a problem for Buildroot.

It would be nice to find a solution so that an existing native mono
compiler does not break the build.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
