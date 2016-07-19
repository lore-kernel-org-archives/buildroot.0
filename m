From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jul 2016 08:28:52 +0200
Subject: [Buildroot] Access to Buildroot git via https
In-Reply-To: <1468831359.3068.19.camel@synopsys.com>
References: <1468831359.3068.19.camel@synopsys.com>
Message-ID: <20160719062852.GA3656@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2016-07-18 08:44 +0000, Alexey Brodkin spake thusly:
> I'm wondering if there's a way to access Buildroot main git repo via HTTPS?
> Here (https://git.busybox.net/buildroot/) it is mentioned only git protocol URL:

I just tried this:

    $ git clone https://git.busybox.net/buildroot/
    Cloning into 'buildroot'...
    [...]

So it works. But it is slow as hell...

Regards,
Yann E. MORIN.

> git://git.busybox.net/buildroot which doesn't work behind some corporate firewalls
> (and I'm tired asking IT guys to open git port for each particular server IP).
> 
> IMHO HTTPS option would be very convenient especially keeping in mind very few
> people have rights to commit.
> 
> 
> -Alexey
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
