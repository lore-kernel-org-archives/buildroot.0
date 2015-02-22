From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 22:27:48 +0100
Subject: [Buildroot] [PATCH 1/2] package/thrift: fix build failure on
 bfin
In-Reply-To: <1424640307-26144-1-git-send-email-romain.naour@openwide.fr>
References: <1424640307-26144-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150222222748.64849cf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 22 Feb 2015 22:25:06 +0100, Romain Naour wrote:
> Libtool append the sysroot path (lt_sysroot) with the libdir value found in
> the libstdc++.la file only with bfin toolchain.

And to you know why ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
