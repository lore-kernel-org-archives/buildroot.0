From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 12:28:02 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libical: bump version to
 v1.0.1 and switch to cmake
In-Reply-To: <1430558104-32357-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430558104-32357-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150713122802.4ad315fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  2 May 2015 11:15:04 +0200, Bernd Kuhls wrote:
> Project moved to github according to http://sourceforge.net/projects/freeassociation
> 
> "As of 2014-06-14, this project may now be found at http://github.com/libical."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: use _SITE instead of github helper (Thomas)
>     add C++ dependency

Applied after doing the following change:

    [Thomas: propagate the C++ dependency to bluez5_utils OBEX support,
    which selects libical.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
