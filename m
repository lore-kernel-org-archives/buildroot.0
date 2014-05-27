From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 May 2014 19:07:45 +0200
Subject: [Buildroot] [PATCH v10 00/29] xbmc: bump version to 13.1 Beta2
In-Reply-To: <1401049582-2110-1-git-send-email-bernd.kuhls@t-online.de>
References: <1401049582-2110-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140527170745.GA3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-25 22:25 +0200, Bernd Kuhls spake thusly:
> the patch series combines my latest patches to bump xbmc.

I've pushed an updated series to:
    git://gitorious.org/buildroot/buildroot.git yem/bernd/xbmc-10

It is not final, I still have a few quirks to iron out before I
re-spin, but hopefully, I should have time either tonight or
tomorrow.

However, it is in sufficiently a good shape that it builds a working
Gotham for the Raspberry Pi, and it is smoother than Frodo. I have yet
to exercise it a bit harder than simply booting and playing short
videos, but Maxime is supposed to already be using it to watch his
movies. So it all looks pretty neat! :-)

So we should be able to merge this really soon after both Gotham 13.1
and Buildroot 2014.05 are out.

I'm really thrilled at having this packaged in Buildroot! Once again:
good work you did! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
