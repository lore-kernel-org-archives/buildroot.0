From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Sep 2013 22:55:14 +0200
Subject: [Buildroot] [PATCH 2 of 9 v4] Config.in.legacy: update
 description for users
In-Reply-To: <ac4d080274a06689e8d4.1378152471@argentina>
References: <patchbomb.1378152469@argentina>
 <ac4d080274a06689e8d4.1378152471@argentina>
Message-ID: <20130902225514.7d9323cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 02 Sep 2013 22:07:51 +0200, Thomas De Schampheleire wrote:

>  if BR2_LEGACY
>  comment "Your old configuration uses legacy options that no  "
> -comment "longer exist in buildroot.                          "
> -comment "Please look at the options which have been selected "
> -comment "and read their help text.                           "
> -comment "As long as these options stay selected, the build   "
> +comment "longer exist in buildroot, as indicated in the menu "
> +comment "below. As long as these options stay selected, or in"
> +comment "case of string options are non-empty, the build     "
>  comment "will fail.                                          "
> +comment "*                                                   "
> +comment "Where possible, an automatic conversion from old to "
> +comment "new symbols has been performed. Before making any   "
> +comment "change in this legacy menu, make sure to exit the   "
> +comment "configuration editor a first time and save the      "
> +comment "configuration. Otherwise, the automatic conversion  "
> +comment "of symbols will be lost.                            "

This really seems ugly for users, no? I know it's been discussed, but
can you summarize why this should be done by our users?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
