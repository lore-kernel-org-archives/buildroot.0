From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 23:23:39 +0200
Subject: [Buildroot] [PATCH] pppd: Move netinet/in.h above linux header
 includes
In-Reply-To: <1476997957-27184-1-git-send-email-Stefan.Nickl@gmail.com>
References: <1476997957-27184-1-git-send-email-Stefan.Nickl@gmail.com>
Message-ID: <20161020232339.54683f92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Oct 2016 23:12:37 +0200, stefan.nickl at gmail.com wrote:
> From: Stefan Nickl <Stefan.Nickl@gmail.com>
> 
> Linux uapi headers try to avoid redeclaring things from libc via
> linux/libc-compat.h. However that only works if the libc header is
> included first.
> 
> Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

Thanks for your contribution! However, exactly 15 minutes before you
sent this patch, I committed a change for the same problem:
https://git.buildroot.org/buildroot/commit/?id=035567b2793f3649e2ddc6cd34b75dd643f47d73.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
