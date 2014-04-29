From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 19:13:57 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: new package
In-Reply-To: <535FDC9F.70805@zacarias.com.ar>
References: <1398790166-18900-1-git-send-email-gustavo@zacarias.com.ar>
 <20140429165618.GB3248@free.fr> <535FDC9F.70805@zacarias.com.ar>
Message-ID: <20140429171357.GC3248@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-04-29 14:08 -0300, Gustavo Zacarias spake thusly:
> On 04/29/2014 01:56 PM, Yann E. MORIN wrote:
> > Would it make sense to add them as host-tools, too?
> 
> Not really IMHO.
> Grub2 can in theory understand btrfs, but that would be realistically
> speaking a x86/amd64-only thing.
> And then btrfs-progs AFAIK doesn't include any tool to create images
> like genext2fs does, it talks directly with block devices.
> Sudo with loopback is a bit dangerous and off the charts i think.

Yep, what I feared... Too bad, then.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
