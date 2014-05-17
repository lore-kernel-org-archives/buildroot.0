From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 23:26:11 +0200
Subject: [Buildroot] [PATCH 2/2] php-imagick: propagate BR2_USE_MMU
	dependency
In-Reply-To: <1400335344-8531-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 May 2014 16:02:24 +0200")
References: <1400335344-8531-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1400335344-8531-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738g8nll8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > php-imagick selects imagemagick, and imagemagick 'depends on
 > BR2_USE_MMU', but this dependency was not propagated to
 > php-imagick. This commit fixes that.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
