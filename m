From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 09:29:07 +0200
Subject: [Buildroot] [PATCH] google-breakpad: bump to version r1373
In-Reply-To: <1410482388-6143-1-git-send-email-fhunleth@troodon-software.com>
References: <1410482388-6143-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20140912092907.75bd143e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Thu, 11 Sep 2014 20:39:48 -0400, Frank Hunleth wrote:
> This version adds support for installing important header files to
> <staging>/usr/include/breakpad. It's no longer necessary to include the
> whole breakpad source tree when building applications using libbreakpad.a.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/google-breakpad/google-breakpad.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
