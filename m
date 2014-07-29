From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 00:04:22 +0200
Subject: [Buildroot] [PATCH] Add target-clean makefile target
In-Reply-To: <1403778551-31435-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1403778551-31435-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20140730000422.682eaaee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 26 Jun 2014 12:29:11 +0200, Angelo Compagnucci wrote:
> This makefile target wipes the target folder and forces buildroot into rebuild it.
> It's useful when you have changed the list of packages and the target
> tree remains out of sync keeping old installed packages no longer needed.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)

Following the discussion, you received several suggestions to improve
the patch in order to make it acceptable. Therefore, I'll mark your
patch as "Changes Requested" in our patch tracking system, and we'll
wait for you to submit a new iteration that takes into account the
comments that were made during the discussion.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
