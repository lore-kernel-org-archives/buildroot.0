From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 19:06:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/cmake: with BR2_ENABLE_DEBUG
 use RelWithDebInfo
In-Reply-To: <CAHXCMMJrKaCxTSh1psSfDHF6_S2XtHwLA32SBbQGWs2HVGTToA@mail.gmail.com>
References: <1463861314-15547-1-git-send-email-ckhardin@exablox.com>
 <20160611161913.5ad9765f@free-electrons.com>
 <CAHXCMMJrKaCxTSh1psSfDHF6_S2XtHwLA32SBbQGWs2HVGTToA@mail.gmail.com>
Message-ID: <20160611190604.020d7531@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Jun 2016 17:22:24 +0200, Samuel Martin wrote:

> By default CMake sets the CFLAGS like this:
> CMAKE_C_FLAGS_DEBUG=-g
> CMAKE_C_FLAGS_RELWITHDEBINFO=-O2 -g -DNDEBUG

Is -O2 -g really what we want for debugging? Optimized code very often
doesn't play well with debugging.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
