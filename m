From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 20:58:16 +0200
Subject: [Buildroot] What happened to uclibc-update-config?
In-Reply-To: <1398705091.394515596@apps.rackspace.com>
References: <1398705091.394515596@apps.rackspace.com>
Message-ID: <CAAXf6LUhWAGt0JX=5fKb+58rfYm8RkQP=-VqgMcUMqGfJtnRzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dan,

On Mon, Apr 28, 2014 at 7:11 PM, Dan Moulding
<dan.moulding@rackwareinc.com> wrote:
> Hi,
>
> I am attempting to save my customized uclibc configuration using the methods prescribed in the Buildroot user manual. It mentions the existence of several "*-update-config" "make" targets. I've done "make busybox-update-config" and that seems to work just fine. But when I try "make uclibc-update-config" I get a "No rule to make target" error from "make".
>
> Looking back in the history, I see that the "uclibc-update-config" target was removed when uClibc was converted to the package infrastructure (commit a5e92d9). Was it never added back? Is there an alternative? Or do I need to just manually copy the .config for uclibc for now?

Thanks for the report. I don't think uclibc-update-config was removed
intentionally, so I'll submit a patch that adds it again...

Best regards,
Thomas
