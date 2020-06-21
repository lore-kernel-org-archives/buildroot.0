From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 09:55:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 4.3
In-Reply-To: <20200621075419.GX2351@scaer>
References: <20200620213401.689760-1-bernd.kuhls@t-online.de>
 <20200621075419.GX2351@scaer>
Message-ID: <20200621075543.GY2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-21 09:54 +0200, Yann E. MORIN spake thusly:
> On 2020-06-20 23:34 +0200, Bernd Kuhls spake thusly:
> > Added patch to fix build without ssse3.
> > 
> > Updated license hash due to various changes since August 2019, these
> > changes are unrelated to buildroot:
> 
> That's wrong: any change in the licensing terms *is* worth explaining.
> Blindly changing the license hashes without explaining what has changed
> makes the hashes useless.
> 
> So I've expanded the commit log with a summary of those changes.
[--SNIP--]
> This now provides a clear history of the patch, where it originates
> from, who did what with it, and in which order.

And of course: applied to master, thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
