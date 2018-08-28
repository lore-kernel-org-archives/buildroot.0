From: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Tue, 28 Aug 2018 14:01:21 -0300 (BRT)
Subject: [Buildroot] [PATCH next v3] atop: fix minor() major() build
 failure
Message-ID: <768040123.3219118.1535475681370.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[re-sending only to the list after I updated my e-mail address (.ind.br -> .com.br) in
 the mailing list subscription.]

Giulio Benetti wrote:

> On arm / cortex-a8 Arch/Subarch sys/types.h doesn't include
> sys/sysmacros.h which contains minor() and major() macros.
> 
> Add patch to directly include <sys/sysmacros.h> into photosyst.c where
> minor() and major() macros are used.
> 
> Patch has been taken from atop upstream pull request:
> https://github.com/Atoptool/atop/pull/35
> 
> Fixes
> http://autobuild.buildroot.net/results/3fc/3fc0f18ed94697c404e7ff3751781789170c4fe5//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>


Regards,
--
Ricardo Martincoski
DATACOM 
Ethernet Switches 
Rua Am?rica, 1000 - Eldorado do Sul, RS - 92990-000 - Brasil
+55 51 3933 3000 - Ramal 3307
ricardo.martincoski at datacom.com.br
www.datacom.com.br
