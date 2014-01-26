From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2014 11:28:26 +0100
Subject: [Buildroot] [PATCH 3/3] package/omxplayer: new package
In-Reply-To: <CAAXf6LUT5+t=L6CBTM48S8eAK5yKi=e8-JMXaaPnsWzGKU-q4A@mail.gmail.com>
References: <cover.1390593263.git.yann.morin.1998@free.fr>
 <bba0db27fca5c16bb8903f9197aae390a2c46e01.1390593263.git.yann.morin.1998@free.fr>
 <CAAXf6LUT5+t=L6CBTM48S8eAK5yKi=e8-JMXaaPnsWzGKU-q4A@mail.gmail.com>
Message-ID: <20140126102825.GA3517@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-25 21:39 +0100, Thomas De Schampheleire spake thusly:
> Op 24-jan.-2014 20:56 schreef "Yann E. MORIN" <yann.morin.1998@free.fr>:
> > +OMXPLAYER_VERSION       = f666a5dfbec36e2af7cd965558ac8643c86277a6
> > +OMXPLAYER_SITE          = git://github.com/popcornmix/omxplayer.git
> 
> Any specific reason why you're using the git protocol and not the github
> helper (https)?

The only reason is that I initially wrote this patch before the github
helper existed, and that I forgot to switch.

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
