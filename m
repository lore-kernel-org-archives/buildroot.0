From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 10:19:39 +0200
Subject: [Buildroot] [PATCH] package/cegui: disable Python SWIG
 extension modules when OpenGL renderer is disabled
In-Reply-To: <fb9e9d4f-7b2a-61ea-b18d-dacd742c6075@grinn-global.com>
References: <20210615194536.265246-1-b.bilas@grinn-global.com>
 <20210718222736.278b6c6f@windsurf>
 <fb9e9d4f-7b2a-61ea-b18d-dacd742c6075@grinn-global.com>
Message-ID: <20210719101939.634b416b@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 19 Jul 2021 10:08:01 +0200
Bartosz Bi?as <b.bilas@grinn-global.com> wrote:

> > So if nobody uses it, we should rather disable it unconditionally. Do
> > you agree ?  
> 
> Yup, let's do that. Should I send v2 or will you do that during committing?

If you could send a v2, it would be great :)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
