From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 07 Oct 2019 20:31:46 -0300
Subject: [Buildroot] [PATCH 3/4] support/testing: add lua-sdl2 test
References: <20190929125520.16957-3-francois.perrad@gadz.org>
Message-ID: <5d9bcae2b00aa_301a2b10e11045244575@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Sep 29, 2019 at 09:55 AM, Francois Perrad wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

These test cases fail on current master:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/312517926
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/312517929

The same test cases pass after applying a fix:
https://patchwork.ozlabs.org/patch/1172611/
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/314232922
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/314232995


Regards,
Ricardo
