From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:27:57 +0200
Subject: [Buildroot] [PATCH v12 0/3] Relocatable SDK: preparatory changes
In-Reply-To: <20161017210543.21573-1-s.martin49@gmail.com>
References: <20161017210543.21573-1-s.martin49@gmail.com>
Message-ID: <20161019232757.6d6118c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 23:05:40 +0200, Samuel Martin wrote:

> Samuel Martin (3):
>   core: split variables definition related to in/out-of-tree build from
>     O itself
>   core: reorder top-level Makefile and document things
>   core: re-enter make if $(CURDIR) or $(O) are not canonical paths

I've merged those three patches. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
