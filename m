From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 16:30:13 +0100
Subject: [Buildroot] [PATCH 3/3] package/boost: add library coroutine2
In-Reply-To: <566AE6EA.9040005@imgtec.com>
References: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
 <1449842279-22712-3-git-send-email-joerg.krause@embedded.rocks>
 <566AE6EA.9040005@imgtec.com>
Message-ID: <20151211163013.1c10a143@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Fri, 11 Dec 2015 15:08:26 +0000, Vicente Olivert Riera wrote:

> I was trying to test your patch and I have noticed that despite of
> having coroutine2 selected...
> 
> BR2_PACKAGE_BOOST_COROUTINE2=y
> 
> ...there isn't any libboost_coroutine2.so file installed on target. Is
> that normal?

The vast majority of Boost "libraries" are not libraries in the .so
sense, but purely header based libraries, i.e just a bunch of .h with
very complicated C++ code.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
