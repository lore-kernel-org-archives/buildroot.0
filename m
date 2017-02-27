From: Ben Boeckel <mathstuf@gmail.com>
Date: Mon, 27 Feb 2017 13:35:47 -0500
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <20170227183016.GC17670@free.fr>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
 <1488215544.31837.9.camel@embedded.rocks>
 <20170227172540.GA17670@free.fr> <20170227183016.GC17670@free.fr>
Message-ID: <20170227183547.GA1242@megas.kitware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 27, 2017 at 19:30:16 +0100, Yann E. MORIN wrote:
> Of course, this is only for when we build out own cmake, not when we use
> the host pre-installed one. I'll try to see tonight if we can do similar
> for it, too.

It may make sense to support this upstream. CMake already has platform
files for things such as Cray and Android (among others) which are just
special kinds of Linux, like Buildroot.

How often does that toolchain file change? Or does it depend on
Buildroot settings?

--Ben
