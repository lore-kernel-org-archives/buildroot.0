From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:30:00 +0200
Subject: [Buildroot] [PATCH v4 0/2] add gettext-tiny package
In-Reply-To: <20190331142907.5b459037@windsurf>
References: <20190327230831.31468-1-vadim4j@gmail.com>
 <20190331142907.5b459037@windsurf>
Message-ID: <20190331143000.5ed20d14@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Mar 2019 14:29:07 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> A couple of notes/suggestions:
> 
>  - It would be nice if you could work with upstream gettext-tiny to
>    make sure gettext-tiny provides everything we need, without the need
>    to bring some files from gettext-gnu.
> 
>  - The ecryptfs-utils package can probably see its BR2_USE_WCHAR
>    dependency removed. Indeed, when BR2_SYSTEM_ENABLE_NLS is disabled,
>    we use gettext-tiny, and wchar is no longer needed. And
>    BR2_SYSTEM_ENABLE_NLS depends on wchar.
> 
>  - I have sent a patch for utils/genrandconfig that randomly sets BR2_SYSTEM_ENABLE_NLS=y in the autobuilder configurations, in order to test this situation.

Gah, I hit Ctrl+Enter and it sent the e-mail before I finished. I meant
to wrap this line, and say:

Thanks a lot for this contribution, it was not trivial, but it's
definitely a nice improvement!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
