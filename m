From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 22:13:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: fix build without NLS
In-Reply-To: <20190610095146.2385-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 10 Jun 2019 11:51:46 +0200")
References: <20190610095146.2385-1-fontaine.fabrice@gmail.com>
Message-ID: <87ef3kcb6p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use nls option to enable/disable NLS depending on BR2_SYSTEM_ENABLE_NLS
 > (and fix second patch) to avoid a build failure if libintl.h is found
 > but xgettext is not available:

 > Has header "libintl.h" : YES
 > Library intl found: NO

 > po/meson.build:28:5: ERROR: Can not do gettext because xgettext is not installed.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0ab0a42fd4c5c9fd5891f3b84287bd788f763ba4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
