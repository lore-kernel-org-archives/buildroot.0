From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Apr 2018 21:35:34 +0200
Subject: [Buildroot] Including legal-info manifest into rootfs?
In-Reply-To: <6235a2ee-dc86-a18f-2278-5915bb1027ca@gmail.com>
References: <6235a2ee-dc86-a18f-2278-5915bb1027ca@gmail.com>
Message-ID: <20180426193534.GA2471@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florian, All,

On 2018-04-26 09:55 -0700, Florian Fainelli spake thusly:
> I find myself in need of including the legal-info manifest into the
> rootfs, there does not appear to be a package that would include that,
> but that would seem like a natural approach to doing this.
> 
> Right now this is done as a step in post-build.sh, but this is less than
> ideal because it still makes it environment specific.
> 
> Has anybody done that before?

Now, yes: https://patchwork.ozlabs.org/patch/905327/ ;-)

Note: I find it a bit haskish still, so thorough testing would be needed. ;-)

Especially, I haven't tested how it works with an initralfs or initrd
linked into the kernel...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
