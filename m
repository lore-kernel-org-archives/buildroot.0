From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Sep 2011 22:46:01 +0200
Subject: [Buildroot] [PATCH 03/21] gtk2-themes: normalize package name
	and directory
In-Reply-To: <234d0748afaaceec52b490697920b8716f063d76.1316464690.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:53:06 +0200")
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
 <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
 <234d0748afaaceec52b490697920b8716f063d76.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aa9z2b92.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---

 Thomas> +++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
 Thomas> @@ -15,4 +15,4 @@ GTK2_THEME_HICOLOR_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NA
 
 Thomas>  GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
 
 Thomas> -$(eval $(call AUTOTARGETS,package,gtk2_theme_hicolor))
 Thomas> +$(eval $(call AUTOTARGETS,package,gtk2-theme-hicolor))

This should be package/gtk2-themes rather than package.

Committed with that fix, thanks.

-- 
Bye, Peter Korsgaard
