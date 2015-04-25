From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:46:17 +0200
Subject: [Buildroot] [PATCH 6/6] package/perl-mail-spamassassin: new
 package
In-Reply-To: <1429970088-593-6-git-send-email-bernd.kuhls@t-online.de>
References: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
 <1429970088-593-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150425164617.43f7db2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 25 Apr 2015 15:54:48 +0200, Bernd Kuhls wrote:
> This package contains a dependency check which only checks for installed
> modules in host-perl, not the target variant. Therefore some host package
> of perl modules are needed as dependency.

Are they needed because they are used, or needed just to please the
dependency checks of spamassassin?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
