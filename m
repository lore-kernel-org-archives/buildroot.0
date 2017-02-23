From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 21:54:42 +0100
Subject: [Buildroot] [PATCH] docs/website: Improving website speed
In-Reply-To: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170223215442.368ece35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 23:52:36 +0100, Angelo Compagnucci wrote:
> Currently the buildroot website is not leveraging common
> techniques to have a better loading speed (browser caching,
> gzip compression, deflating).
> This commit provides an .htaccess files with all the needed to
> enable mentioned features. This .htaccess only works if the
> webserver has deflate, expires and headers modules enabled.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Thanks for your proposal. Since this needs to work with the Apache
configuration on the server side, I've mailed the OSUOSL folks to ask
them if this is going to work. You are in Cc to this e-mail.

Regarding your other patch crunching and resizing the PNG files, it
didn't make it to the list because of the size of the patch. However,
while I understand the crunching, I do not understand why you
arbitrarily reduced the size of the pictures by 60%. Could you explain
the reasoning behind this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
