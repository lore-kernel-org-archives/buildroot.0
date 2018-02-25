From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 18:52:47 +0100
Subject: [Buildroot] Drop support for Qt 5.6? [was: [RFC 1/2] qt5: bump
 latest version to 5.10.0]
In-Reply-To: <CALoSW672Hh1KbdDRWE72JjZn4ajqM1zdFuNakGEJ3G0XM=g6hQ@mail.gmail.com>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
 <1518442630960-0.post@n4.nabble.com>
 <78215947-020b-17da-27d8-89bcdfe1c859@mind.be>
 <20180225172619.GA2276@scaer>
 <CALoSW672Hh1KbdDRWE72JjZn4ajqM1zdFuNakGEJ3G0XM=g6hQ@mail.gmail.com>
Message-ID: <20180225175247.GB2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nimai, All,

On 2018-02-25 17:42 +0000, Nimai Mahajan spake thusly:
> I completely overlooked the bump to LGPLv3, my apologies. As mentioned, it forces many companies to use the commercial license due
> to much more stringent rules, which is unacceptable.
> That being said, we use Qt at work on a daily basis and 5.6 is missing tons of new features and security updates, which forced us to
> move to 5.9.x. 5.9.x added the new qt quick controls 2 embedded controls, which just about every project today is using, especially
> on embedded devices that are resource limited.

If you upgraded to 5.9, it means the licensing "issue" is not an issue
for you. So, why do you not upgrade to 5.10 for your own project, then?

> I think the only compromise here is to rework the Qt build system to leave the Qt 5.6.x LTS series (legacy LTS), add in Qt 5.9.x LTS
> (latest LTS), and Qt 5.10.x as the bleeding edge / latest. I'm not sure how others feel about that though and how much work that is.
> It's not trivial to test all 3 versions on the myriad of architectures and platforms Buildroot supports.

My position would be to just change the "latest" to be the actual
latest, i.e. 5.10.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
