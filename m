From: Vishal Thanki <vishalthanki@gmail.com>
Date: Mon, 20 Feb 2017 13:39:04 +0100
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: Add config option to
 install "bdaddr"
In-Reply-To: <20170215094204.22df2cb5@free-electrons.com>
References: <1487084632-16396-1-git-send-email-vishalthanki@gmail.com>
 <20170214160844.ts44yh2l4ghzwvad@tarshish>
 <20170214211443.00dc1a10@free-electrons.com>
 <20170215063911.ojfnao67fbpsojy7@tarshish>
 <20170215094204.22df2cb5@free-electrons.com>
Message-ID: <CAC3a_SAqi27AMqk3CngKosbM5qius2bqv_5+qmyRS17i_xAZHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Baruch,

Thanks for your comments.

>> All should go under BR2_PACKAGE_BLUEZ5_UTILS_TOOLS, as well as --enable-tools,
>> IMO.
>
> Well, 5.7 MB and 56 executables is definitely not a small amount, so I
> would tend to instead accept a more fine-grained selection of the tools.
>

Does this mean that "bdaddr" should be enabled with a separate option
as done in this patch? OR this patch should also provide options for
all other tools which do not get installed by default?

> However, if indeed --enable-tools is optional, we shouldn't enable it
> unconditional, but have an option for that.
>

Should "--enable-tools" option in buildroot be handled in this patch
or in a separate patch?

Thanks,
Vishal
