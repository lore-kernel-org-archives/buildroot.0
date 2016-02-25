From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:26:11 +0100
Subject: [Buildroot] [PATCH v2 0/4] Add file capability/xattr support
In-Reply-To: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160225222611.51d0dd77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Wed, 24 Feb 2016 11:26:28 -0300, gustavo.zacarias at free-electrons.com
wrote:

> Gustavo Zacarias (4):
>   attr: add host variant
>   attr: cleanup pointless indentation
>   libcap: enable extended attribute support

In order to help and reduce your patch back log, I've applied those
three patches.

>   fakeroot: enable capability support

I'm marking this one as RFC in Patchwork, so that work on making it
optional, and a way of defining the xattr/capabilities is implemented.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
