From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 27 Sep 2013 12:08:22 +0200
Subject: [Buildroot] [PATCH] configs: add Freescale i.MX 6SoloLite EVK
	support
In-Reply-To: <87ioxm4m6m.fsf@dell.be.48ers.dk>
References: <1380185523-26736-1-git-send-email-gilles.talis@gmail.com>
 <87fvsr5q7z.fsf@dell.be.48ers.dk>
 <CAKcgs2wLPOTpRqu5Xe_1LkuuZwCcuAfHOSfS+Hy+gvpbS_Vk3g@mail.gmail.com>
 <87ioxm4m6m.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2x1v5=aMLy0HCbJoLGK-A9rn=WBNZevgbyk-Jnui5yK9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> It's not really a problem, no - Just quite uncommon. Do notice that
> Buildroot automatically enables devtmpfs support in the kernel if
> needed, so it should all just work.

Does it? I was not aware of that. It did not seem to work for me,
hence the reason why I had to force static device nodes. Let me give
it another try and see how it goes.
Thanks

Gilles.
