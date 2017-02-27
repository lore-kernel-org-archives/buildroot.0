From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 27 Feb 2017 18:12:24 +0100
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1488215544.31837.9.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sun, 2017-02-26 at 23:42 +0100, Yann E. MORIN wrote:
> cmake-3.7 has a bug in how it handles rpath, linking with libraries
> from
> the host.
> 
> Until we completely understand the issue, just blacklist cmake-3.7.
> 
> The issue has been reported upstream:
> ????http://public.kitware.com/pipermail/cmake/2017-February/064970.ht
> ml

Brad King from Kitware replied today [1]. In short, Brad does not think
there anything wrong about handling the rpath and supposes to load a
custom platform cmake file instead of the Linux one.

[1] http://public.kitware.com/pipermail/cmake/2017-February/065063.html

J?rg
