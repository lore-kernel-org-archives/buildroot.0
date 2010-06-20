From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jun 2010 17:02:25 +0200
Subject: [Buildroot] [PATCH 00/19] Convert packages to new autotools
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <20100620170225.6b73c3e4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Jun 2010 19:47:02 +0800
cmchao <cmchao@gmail.com> wrote:

>  The work convert 19 autotool-based packages to new infrastructure and some of them
>  are upgraded to new version

Thanks! I've picked up all patches, except the lrzsz one which has
already been merged in mainline by Peter, and I've integrated those
patches into my autotools-conversion branch at

 http://git.buildroot.net/~tpetazzoni/git/buildroot/log/

I've already done a bunch of small improvements to your patches and
I'll test them now. Once they'll be ready, I'll push them to Peter.

Thanks for doing this work!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
