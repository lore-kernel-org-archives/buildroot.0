From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Aug 2017 09:28:12 +0200
Subject: [Buildroot] [git commit] Update for 2017.08-rc1
In-Reply-To: <20170802211523.BFC8881E4E@busybox.osuosl.org>
References: <20170802211523.BFC8881E4E@busybox.osuosl.org>
Message-ID: <20170803092812.35d282ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Aug 2017 23:00:13 +0200, Thomas Petazzoni wrote:

>  # Set and export the version string
> -export BR2_VERSION := 2017.08-git
> +export BR2_VERSION := 2017.08-rc1
>  # Actual time the release is cut (for reproducible builds)
> -BR2_VERSION_EPOCH = 1496267000
> +BR2_VERSION_EPOCH = 150170700

As noticed by Florent Jacquet, I messed up here. I wanted to round a
bit the epoch date (like was done for previous releases), but while
doing this, I forgot to re-add a zero.

Therefore, your 2017.08-rc1 is dated from October 5th, 1974, instead of
the expected August 2nd, 2017.

I'll fix that up for the -rc2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
