From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Dec 2012 20:43:12 +0100
Subject: [Buildroot] [PATCH 0/51 v4] Add QEMU for runing on the target
In-Reply-To: <20121209194100.72987f2c@skate>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <20121209194100.72987f2c@skate>
Message-ID: <201212092043.12794.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 09 December 2012 Thomas Petazzoni wrote:
> On Sun,  9 Dec 2012 17:34:33 +0100, Yann E. MORIN wrote:
> > This patch series adds qemu as a package to run on the target.
> > 
> > Although this may sound weird in a first place, I use it to build a
> > simple VM server.
> 
> Do you have a public Git branch with all those patches, so that we can
> easily do some testing without having to apply manually all your
> patches?

For those interested, I've put up the series on gitorious:
    git://gitorious.org/buildroot/buildroot.git
    branch: yem-qemu

This branch already contains the removeal of the _AVAILABLE symbols,
spotted by Thomas.

I have no clue how to manage this, and I don't know (yet?) how I'll manage
to push updates to this branch, so do not expect any miracle! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
