From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 23:28:13 +0100
Subject: [Buildroot] [PATCH 1/1] crda: fix build failure for nios2
In-Reply-To: <530138C2.7010109@frajasalo.de>
References: <530138C2.7010109@frajasalo.de>
Message-ID: <CAHXCMMLivOdEhouJnVGQ=XiEN8zU7vbAv0Gm9SbiUOkEiVxCsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 16, 2014 at 11:16 PM, Frank Bergmann <frank@frajasalo.de> wrote:
> libgcrypt depends on libgpg-error and this isn't accounted for in
> crda makefile, but it is in libgcrypt-config script (in the correct
> order for linking), so set LDLIBS calling this script not only for
> static linking.
>
> Fixes
> http://autobuild.buildroot.org/results/156/15656ef0187b0a8db6c66fc7a7fcb58a99999fa1
>
> Signed-off-by: Frank Bergmann <frank@frajasalo.de>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>


Regards,

-- 
Samuel
