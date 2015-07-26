From: Adam Baxter <voltagex@voltagex.org>
Date: Sun, 26 Jul 2015 09:26:57 -0700
Subject: [Buildroot] Unable to login as root to new buildroot system
In-Reply-To: <20150726182515.1e0b67c8@free-electrons.com>
References: <CAChFQ9R=5anPgo9mboKxCkppsadQkSzC_WhpevWoarwgKVhLQg@mail.gmail.com>
 <20150726182515.1e0b67c8@free-electrons.com>
Message-ID: <CAChFQ9QdOZ=BLF7fQ2XjcW2YszGcD2PuXWGydkW-zEbsLitGsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 July 2015 at 09:25, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Adam Baxter,
>
>
> Your configuration has:
>
> BR2_TARGET_GENERIC_GETTY_OPTIONS="-n"
>
> Are you sure you really want this getty option?
>

Probably not, thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150726/c27205bf/attachment.html>
