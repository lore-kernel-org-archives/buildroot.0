From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 20 Jul 2015 20:15:04 +0100
Subject: [Buildroot] [PATCH] autobuild - acpid does not build against
	musl
In-Reply-To: <20150720185253.GR13027@tarshish>
References: <1437417346-18621-1-git-send-email-brendanheading@gmail.com>
 <20150720185253.GR13027@tarshish>
Message-ID: <CA+BsyQ6zhyOA0pLW0C0KmgJx6f70Dtcyd-kj_Qft+qCGefJ7QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

> Please spare a few words on what this patch is doing.

Sure.

>> +Some external toolchains using strange C libraries (eg MUSL) do not define
>> +this macro.
>
> What is the upstream status of this patch?

I've not checked. Should I do so before resubmitting ?

I must admit I wasn't too sure about the idea of the patch here, as it
fixes only one package rather than addressing an issue that will
effect any package using the same macro. But I noted a precedent for
this (in the same package, there is a patch to add a macro missing
from unpatched uclibc versions configured as part of an external
toolchain) so I went ahead and submitted.

I can certainly raise it with the upstream devs ..

> Does this patch fix build failure or correctness? Buildroot generally doesn't
> carry warning fix only patches.

Warnings only. I will remove.

Thanks for the feedback on my first ever patch :)

Regards

Brendan
