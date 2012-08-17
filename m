From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 18:03:24 +0200
Subject: [Buildroot] [PATCH v3] at91bootstrap3: new package
In-Reply-To: <1345192583-5115-1-git-send-email-spdawson@gmail.com>
References: <1345192583-5115-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120817180324.23f1e328@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 17 Aug 2012 09:36:23 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> Note that this new package, at91bootstrap3, is being added alongside the
> existing at91bootstrap. This was suggested by Thomas Petazzoni, whose
> comments on the mailing list are quoted below.
> 
>   For this package, I am not sure we can do a simple version bump. Since
>   there is (was?) no upstream for AT91Bootstrap 1.x, many
>   vendors/companies had to maintain their patches on top of AT91Bootstrap
>   1.x. See for example
>   board/calao/usb-a9263/at91bootstrap-1.16-usb-a9263.patch. Therefore,
>   removing AT91Bootstrap 1.x from the tree will prevent those platforms
>   to work. I know people should upgrade, but AT91Bootstrap 3.x is quite
>   significantly different, so the porting effort is not that simple.
> 
>   Therefore, I'm wondering whether we should kee at91bootstrap as it is,
>   and create a separate package at91bootstrap3 for the 3.x generation.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to next, thanks.

Later on, we may want to add an at91bootstrap3-menuconfig target, like
we have for Barebox/Linux so that users can tune the configuration
easily. But that can be done later.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
