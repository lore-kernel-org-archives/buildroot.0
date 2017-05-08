From: ren_guo <ren_guo@c-sky.com>
Date: Mon, 8 May 2017 21:43:40 +0800
Subject: [Buildroot] Buildroot defconfig failures
In-Reply-To: <20170508142023.6b95ccf7@free-electrons.com>
References: <20170507145548.336e29ad@free-electrons.com>
 <df95a70f-0e89-750f-1702-25998944fc3a@c-sky.com>
 <20170508142023.6b95ccf7@free-electrons.com>
Message-ID: <bcb5bdd6-08a2-4782-70f4-0a4db45c41ab@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi Thomas,

> Yes, it's OK here as well. And it seems to work fine on Gitlab CI for
> many other toolEchains as well. So we have something weird here.

We will try to make a Gitlab CI environment to determine csky-linux-gcc problem.

> Where will you add the hash? You can't add the hash in Buildroot for
> custom external toolchains.

En... I want to add a toolchain-external-csky, is that ok?

Best Regards

-- 
Guo Ren, Software Engineer, C-SKY
3 XiDoumen Rd,BldgA,15F,Hangzhou,China
P.C: 310012
http://www.c-sky.com
