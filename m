From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jan 2014 21:12:55 +0100
Subject: [Buildroot] Adding support for ipk packages creation?
In-Reply-To: <CA+hj=MrRS3EUgVDw77WxBeqYGayo+tGuSWrKjTuYssvmTytywg@mail.gmail.com>
References: <CA+hj=MrRS3EUgVDw77WxBeqYGayo+tGuSWrKjTuYssvmTytywg@mail.gmail.com>
Message-ID: <20140105201255.GF16066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivan, All,

On 2014-01-05 20:41 +0100, Ivan Wagner spake thusly:
> I think it has been discussed several times during the past and as far
> as I understand buildroot provides a basic (or advanced) creation of a
> rootfs together with bootloader and kernel.
> 
> Has anyone ever thought of adding support, or better, does it make
> sense to add support for the creation of packages?

Buildroot explicitly avoids generating binary packages, on purpose.

Buildroot strive at making it easy to generate a root filesystem (hence
the name, by the way). That is what we want to make Buildroot good at:
building a root filesystem.

Buildroot is not meant to be a distribution (or rather, a distribution
generator). It is the opinion of most Buildroot developpers (me included)
that this is not a goal we should pursue. We believe that there are other
tools better suited to generate a distro than Buildroot is. For example,
Open Embedded, or openWRT, are such tools.

Rather, we prefer to push Buildroot in a direction that makes it easy
(or even easier) to generate complete root filesystems. This is what
makes Buildroot stands out in the crowd (among other things, of course!).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
