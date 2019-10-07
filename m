From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 07 Oct 2019 20:33:08 -0300
Subject: [Buildroot] [PATCH] package/lua-sdl2: fix install path
References: <20191007040250.23281-1-francois.perrad@gadz.org>
Message-ID: <5d9bcb34f0be2_301a3fe778103ad4473c@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 07, 2019 at 01:02 AM, Francois Perrad wrote:

> WITH_LUAVER must be set with a value depending of Lua interpreter,
> by this way, the module is installed in the correct location
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

[Before this patch the 2 runtime tests from
 http://patchwork.ozlabs.org/patch/1169002/
 fail and after this patch the same test cases do pass]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Failing before this patch:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/312517926
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/312517929

Passing after this patch:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/314232922
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/314232995


Regards,
Ricardo
