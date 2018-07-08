From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jul 2018 12:56:42 +0200
Subject: [Buildroot] [PATCH] package/automake: bump version to 1.16.1
In-Reply-To: <438109890.9050032.1531017842188.JavaMail.zimbra@savoirfairelinux.com>
References: <20180706212709.10376-1-jean-francois.tetu@savoirfairelinux.com>
 <13b9a287-31bf-fc90-5d49-ba78cb68b002@mind.be>
 <438109890.9050032.1531017842188.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <20180708105642.GD2474@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Fran?ois, All,

On 2018-07-07 22:44 -0400, Jean-Fran?ois T?tu spake thusly:
> On Saturday, July 7, 2018 5:31:11 PM, Arnout Vandecappelle wrote:
> > automake is a package that runs a risk of breaking other packages using it.
> > Would you be willing to monitor the autobuild results in the coming weeks to
> > find and fix breakage caused by this bump?
> 
> Gladly, I'll monitor the daily autobuild results and fix whatever breaks.

It looks liek we have our first automake-bump related issues piling up:

    http://autobuild.buildroot.org/results/221/2215acb7e011b9fd469217abbc319941f8f6ee61/build-end.log
    http://autobuild.buildroot.org/results/13d/13d600c8b33017793cd0dbdd5d204ba0b01924a5/build-end.log

Care to have a look?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
