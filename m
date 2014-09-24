From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 24 Sep 2014 09:45:37 +0100
Subject: [Buildroot] [PATCH] keyutils: Bump version to 1.5.9,
 fix patches and static build
In-Reply-To: <20140923215259.3644f7ab@free-electrons.com>
References: <1411401596-26802-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140923215259.3644f7ab@free-electrons.com>
Message-ID: <542284B1.6000105@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/23/2014 08:52 PM, Thomas Petazzoni wrote:
> This fails to build with:
>
> /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -L. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os    -o keyctl keyctl.o -lkeyutils
> /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -L. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os    -o request-key request-key.o -lkeyutils
> key.dns_resolver.c:55:22: fatal error: keyutils.h: No such file or directory
>   #include <keyutils.h>

Thanks Thomas,

patch v2 sent with this problem fixed and also including a hash file.

Regards,

-- 
Vincent
