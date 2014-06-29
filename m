From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 13:20:29 +0200
Subject: [Buildroot] [PATCH v2] uclibc: enable parallel building of
 libraries
In-Reply-To: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>
References: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140629132029.0d46a1d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Fri, 27 Jun 2014 20:26:00 +0400, Alexey Brodkin wrote:
> The use of MAKE1 for uClibc dates back 10 years:
> 
> commit 8e5fb3fb4ab09b4dc04fe7cb3f7becce6514117b
> Author: Eric Andersen <andersen@codepoet.org>
> Date:   Sat Dec 11 13:01:10 2004 +0000
> 
>     Add initial BR2_JLEVEL support, with some exceptions for apps that
>     have broken 'make -j' support
> 
> Since that time there were lots of improvements in uClibc that seem to allow
> parallel building of libs finally.
> 
> Unfortunately uClibc tests have dependences on previously built files,
> that's why tests left with MAKE1.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
