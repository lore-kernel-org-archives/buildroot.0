From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 21:49:27 +0200
Subject: [Buildroot] [PATCH 1/4] perl-datetime-tiny: new package
In-Reply-To: <1406053076-25453-1-git-send-email-francois.perrad@gadz.org>
References: <1406053076-25453-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140723214927.46bbe33e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Tue, 22 Jul 2014 20:17:53 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                                |  1 +
>  package/perl-datetime-tiny/Config.in             |  6 ++++++
>  package/perl-datetime-tiny/perl-datetime-tiny.mk | 14 ++++++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/perl-datetime-tiny/Config.in
>  create mode 100644 package/perl-datetime-tiny/perl-datetime-tiny.mk

Thanks, I've applied your four patches. However, on patches 3 and 4, I
had to change the license:

 apache_2_0 -> Apache-2.0
 mit -> MIT

See http://spdx.org/licenses/ for the list of license codes. You might
want to update you scancpan script to take this into account.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
