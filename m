From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jul 2017 10:15:18 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: Bump to version 2017-06-30
In-Reply-To: <87lgnpal7b.fsf@dell.be.48ers.dk>
References: <1499277201-14030-1-git-send-email-nerv@dawncrow.de>
 <20170715120954.68067f9b@windsurf>
 <20170715124432.1573e49b@windsurf>
 <87lgnpal7b.fsf@dell.be.48ers.dk>
Message-ID: <20170716081518.GB30047@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-15 15:22 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > So, I'm wondering what to do. Should I give up testing Buildroot on
>  > Debian Squeeze, and move to Debian Wheezy instead?
> 
> With stretch out, I indeed think it makes sense to move away from
> squeeze. According to wikipedia squeeze is no longer supported (since
> Feb 2016):
> 
> https://en.wikipedia.org/wiki/Debian_version_history#Release_table
> 
> In general, I don't think it makes sense to test on any distribution no
> longer supported by their upstream.

We can do our best to support older distros, and not break things on
purpose, but when time has come, we should not refrain from requiring a
more uop-to-date system.

If we accidentally break something, interested parties can try to fix it
and send patches if that is fixable. If that is not fixable, then there
is not much we can do.

Except add even more host packages and become a distro... :-/

So, my position is you update your autobuilder.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
