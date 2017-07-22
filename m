From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jul 2017 16:33:42 +0200
Subject: [Buildroot] [PATCH 03/20] package/skeleton: add macro to rsync
 skeleton directory
In-Reply-To: <2c30f633-ccdb-2e80-fbab-983adf21a80d@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <05879dad2f97f99ddce2b01753aae0e3111f4a43.1500398733.git.yann.morin.1998@free.fr>
 <2c30f633-ccdb-2e80-fbab-983adf21a80d@mind.be>
Message-ID: <20170722143342.GD9929@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-22 15:02 +0200, Arnout Vandecappelle spake thusly:
> On 18-07-17 19:25, Yann E. MORIN wrote:
> > Define a macro that skeleton packages can call to install their skeleton
> > directories. Since at least one occurence of it will want to install in
>                                   occurrence
> > staging, the macro must accept a destination path, rather than hard-code
> > target as the destination.
> 
>  By the way, the overlay copying uses almost the same rsync arguments, so they
> can be used there as well.

This series was only about the skeleton thingy, so I refrained from
doing cleanup works elsewhere. Or you'd have had a series with far more
than 20 patches. ;-)

But yeah, I see your point, and that can be added in the future.

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
