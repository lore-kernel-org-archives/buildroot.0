From: Christian Stewart <christian@paral.in>
Date: Sat, 31 Mar 2018 17:42:34 +0000
Subject: [Buildroot] [PATCH v3 2/8] dumb-init: new package
In-Reply-To: <8e3b124c-2961-bd82-f788-9c94eddb84ab@smile.fr>
References: <20180304004346.331-1-christian@paral.in>
 <20180304004346.331-3-christian@paral.in>
 <8e3b124c-2961-bd82-f788-9c94eddb84ab@smile.fr>
Message-ID: <CA+h8R2pyAoT_7Z3i+zgpzZEdLhf+ZBQtzRXJkkMMxYVh-DSjTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sat, Mar 31, 2018, 11:42 AM Romain Naour <romain.naour@smile.fr> wrote:

> Le 04/03/2018 ? 01:43, Christian Stewart a ?crit :
> > Static compilation is used, as dumb-init will typically be executed
> inside a
> > container.
>

See above.

> +config BR2_PACKAGE_DUMB_INIT
>
> The code use fork(), so a depends on BR2_USE_MMU must be added here.
>

Noted.

Also $(TARGET_CFLAGS) may be used here.
>

Also noted :)

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180331/4d717afa/attachment.html>
