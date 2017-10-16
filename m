From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:48:09 +0200
Subject: [Buildroot] [PATCH v2 2/2] configs/minnowboard_max-graphical:
	wchar/grub2 fix
In-Reply-To: <20170905000806.13295-3-sielicki@yandex.com> (Nicholas Sielicki's
 message of "Mon, 4 Sep 2017 19:08:06 -0500")
References: <20170905000806.13295-1-sielicki@yandex.com>
 <20170905000806.13295-3-sielicki@yandex.com>
Message-ID: <87wp3uvk6e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicholas" == Nicholas Sielicki <sielicki@yandex.com> writes:

 > minnowboard_max-graphical_defconfig has the line "BR_TARGET_GRUB2=y",
 > but this currently has no effect because BR_TARGET_GRUB2 cannot be
 > selected without BR2_TOOLCHAIN_BUILDROOT_WCHAR=y, which is not set by
 > default.

 > The minnowboard max defconfig was updated to fix this problem, but the
 > graphical variant was not updated alongside it.

 > Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
