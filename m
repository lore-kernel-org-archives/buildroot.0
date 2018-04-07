From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Apr 2018 23:27:40 +0200
Subject: [Buildroot] [RFC PATCH] download/git: fix basename for files
 inside tarballs
In-Reply-To: <5ac6d9ad67156_74562ac455ee4c30280aa@ultri4.mail>
References: <87zi2imagg.fsf@dell.be.48ers.dk>
 <5ac6d9ad67156_74562ac455ee4c30280aa@ultri4.mail>
Message-ID: <20180407212740.GE2341@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-04-05 23:21 -0300, Ricardo Martincoski spake thusly:
[--SNIP--]
> Inspecting the tarball, what makes linux-firmware uncommon is that it has
> symlinks to upper directories.
> Based on my tests, it seems '--transform=' operates on the symlink destination
> as well. See at the end:
> ..."bin -> linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2./mrvl/"...

I sent a simple fix:

    https://patchwork.ozlabs.org/patch/895967/

Care to give it a spin? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
