From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Feb 2017 23:51:31 +0100
Subject: [Buildroot] [PATCH 1/1] docs/website: Feed API and gmane fix
In-Reply-To: <1486247694-7324-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1486247694-7324-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170204235131.7332d861@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Feb 2017 23:34:54 +0100, Angelo Compagnucci wrote:
> * Google retired feed API, this patch changes in favour of
>   yahoo yql for rss to json conversion
> * Gmane is gone, replacing it with nabble.
> * Removed the import for feed api libraries
> * Updates to the latest jquery version
> * Reorganized javascript code in buildroot.js to accomodate
>   the mentioned fixings

This bullet list is a very good indication that this patch should be
split into several smaller patches. It's doing lots of things that are
fairly independent, or if not independent, that can be split into
several steps.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
