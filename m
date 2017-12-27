From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 21:55:44 +0100
Subject: [Buildroot] [PATCH 1/1] libpqxx: bump to 6.0.0
In-Reply-To: <20171227180810.19405-1-Adamduskett@outlook.com>
References: <20171227180810.19405-1-Adamduskett@outlook.com>
Message-ID: <20171227215544.4f600748@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 13:08:10 -0500, Adam Duskett wrote:
> Other changes:
> - Add a hash for the license file.
> 
> - Change the URL from pqxx.org to the official GitHub repository, as releases
>   are no longer being posted to the old download mirror.
> 
> - Remove the patch, this has been fixed in the upstream code for some time.
> 
> - Remove AUTORECONF, as it is no longer necessary because the patch has been
>   removed.

Rather unusual for a Github-sourced project, but indeed the configure
script and the Makefile.in are under version control, so
autoreconf-iguring is not necessary.

So: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
