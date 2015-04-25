From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 18:11:25 +0200
Subject: [Buildroot] [PATCH 6/6] package/perl-mail-spamassassin: new
 package
In-Reply-To: <XnsA487B2174A825berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
 <1429970088-593-6-git-send-email-bernd.kuhls@t-online.de>
 <20150425164617.43f7db2e@free-electrons.com>
 <XnsA487B2174A825berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150425181125.134ea730@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 25 Apr 2015 17:30:26 +0200, Bernd Kuhls wrote:

> the host-packages are only needed to please spamassassin afaics.
> Their target variants however are really used by Spamassassin:

Then, can we get rid of Spamassassin silly checks on the host perl
modules, to avoid having those unnecessary packages in Buildroot?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
