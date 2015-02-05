From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Feb 2015 14:51:12 +0100
Subject: [Buildroot] [PATCH] libvips: requires C++ support
In-Reply-To: <54D374F3.1040508@imgtec.com>
References: <1423143748-63093-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150205144633.06790e8f@free-electrons.com>
 <54D374F3.1040508@imgtec.com>
Message-ID: <20150205145112.59757f77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 5 Feb 2015 14:49:39 +0100, Vicente Olivert Riera wrote:

> uhm..., the think if you use "--disable-cxx", the .so library is not
> built and then it fails because is not found...
> 
> Maybe this is something we should report upstream?

It seems like we should. And in the mean time, your patch looks OK to
me, as long as you amend it to force --enable-cxx in all cases.

I personally don't really care to support libvips without C++, so if
it's broken upstream, let's report it and not support it until they fix
it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
