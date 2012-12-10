From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Dec 2012 09:17:47 +0100
Subject: [Buildroot] [PATCH 0/51 v4] Add QEMU for runing on the target
In-Reply-To: <201212092043.12794.yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <20121209194100.72987f2c@skate>
 <201212092043.12794.yann.morin.1998@free.fr>
Message-ID: <20121210091747.696fae45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 9 Dec 2012 20:43:12 +0100, Yann E. MORIN wrote:

> For those interested, I've put up the series on gitorious:
>     git://gitorious.org/buildroot/buildroot.git
>     branch: yem-qemu
> 
> This branch already contains the removeal of the _AVAILABLE symbols,
> spotted by Thomas.
> 
> I have no clue how to manage this, and I don't know (yet?) how I'll manage
> to push updates to this branch, so do not expect any miracle! ;-)

For such a working branch, people will normally expect that it will get
rebased. So just rebase as you do usually to rework your patches, and
then to push, do:

 git push -f your-gitorious-remote

Bye,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
