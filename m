From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 12:54:13 +0200
Subject: [Buildroot] [PATCH/next 07/10] package/libilbc: new package
In-Reply-To: <1439317015-8031-8-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
 <1439317015-8031-8-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150829125413.32529484@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 11 Aug 2015 20:16:52 +0200, Bernd Kuhls wrote:

> +LIBILBC_VERSION = 829b08c7902ceb87a261279fabb36b6d523c6e07
> +LIBILBC_SITE = https://freeswitch.org/stash/scm/sd/libilbc.git
> +LIBILBC_SITE_METHOD = git
> +LIBILBC_LICENSE = Global IP Sound iLBC Public License, v2.0

"," is the separator between different licenses applying to the same
package. So I've removed this "," and applied your patch to the next
branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
