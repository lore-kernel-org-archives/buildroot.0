From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 11:22:55 +0100
Subject: [Buildroot] [PATCH v3 1/1] brltty: new package
In-Reply-To: <20171127225645.26681-1-mlang@blind.guru>
References: <20171127225645.26681-1-mlang@blind.guru>
Message-ID: <20171217112255.0075f2af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 23:56:45 +0100, Mario Lang wrote:
> Signed-off-by: Mario Lang <mlang@blind.guru>
> ---
> v2 dealt with feedback from Baruch Siach (thanks).
> v3: Adds optional dependencies on icu, ncurses and systemd.
>     Supports NLS.
>     Adds an option to configure default fallback text table.

Applied to master with the following changes:

    [Thomas:
     - wrap too long CONF_OPTS line that disables all the language
       bindings
     - use an intermediate BRLTTY_TEXT_TABLE variable to store the
       qstripped version of BR2_PACKAGE_BRLTTY_TEXT_TABLE.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
