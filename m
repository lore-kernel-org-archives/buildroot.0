From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2015 15:03:54 +0200
Subject: [Buildroot] [PATCH] rtptools: needs RPC support
In-Reply-To: <1443009479-8481-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443009479-8481-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150923150354.70f6b27a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 23 Sep 2015 12:57:59 +0100, Vicente Olivert Riera wrote:
> rtptools needs a toolchain with RPC support, otherwise it will fail with
> an error message like this one:
> 
> host2ip.c:13:38: fatal error: rpcsvc/ypclnt.h: No such file or directory
>  #include <rpcsvc/ypclnt.h>   /* YP */
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I'm surprised we have not seen autobuilder failures. Or did you forget
to include a reference to an autobuilder error?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
