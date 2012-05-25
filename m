From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 May 2012 22:02:06 +0200
Subject: [Buildroot] [PATCH resend] midori: bump version to 0.4.6
In-Reply-To: <1337950052-18644-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 25 May 2012 13:47:31 +0100")
References: <1337950052-18644-1-git-send-email-spdawson@gmail.com>
Message-ID: <87pq9s81xd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

Hi,
 
 spdawson> -MIDORI_VERSION = 0.3.6
 spdawson> +MIDORI_VERSION = 0.4.6
 spdawson>  MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
 spdawson> -MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.3/
 spdawson> -MIDORI_DEPENDENCIES = host-pkg-config host-intltool webkit libsexy libgtk2
 spdawson> +MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.4/
 spdawson> +MIDORI_DEPENDENCIES = host-pkg-config host-intltool webkit libsexy libgtk2 host-vala $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) $(if $(BR2_PACKAGE_LIBICONV),libiconv)

I've sorted and indented this long _DEPENDENCIES line so it is easier to
read. Committed to next, thanks.

-- 
Bye, Peter Korsgaard
