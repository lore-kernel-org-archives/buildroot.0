From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 21:49:40 +0100
Subject: [Buildroot] [PATCH 0/2] package/libopenssl: fix build wrt
 64-bit time-related structs (branch yem/openssl-riscv32)
In-Reply-To: <cover.1615325812.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 9 Mar 2021 22:37:16 +0100")
References: <cover.1615325812.git.yann.morin.1998@free.fr>
Message-ID: <87a6qyvpgb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > This two-patch series aims at fixing, once and for all, the many build
 > failures we've seen in the autobuilders, related to riscv32.

Those issues are "fixed" now that libopenssl is disabled for riscv32,
right?


 > It turns out that those failures exposed a deeper issue in openssl, that
 > was just fixed upstream

 > Note: the first pach is a candidate for backporting to 2021.02.x, but
 > the second patch is not.

Why? Isn't this only an issue on riscv32? What would the advantage be of
adding those patches if libopenssl isn't available for riscv32?

-- 
Bye, Peter Korsgaard
