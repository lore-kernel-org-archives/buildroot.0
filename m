From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 10:50:07 +0200
Subject: [Buildroot] [PATCH 00/20] Some new Perl modules
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150419105007.411d3dd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Apr 2015 10:33:13 +0200, Bernd Kuhls wrote:

> this patch series adds some modules to buildroot needed by Spamassassin. The
> Spamassassin package itself is not yet finished yet, but these modules can be
> used by other packages as well so I split them from my tree.

Thanks. Could you explain why some of them have a host variant, and why
the host variant is useful?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
