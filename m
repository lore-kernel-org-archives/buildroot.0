From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 7 Mar 2008 10:45:46 +1100
Subject: [Buildroot] svn commit: trunk/buildroot:  scripts
In-Reply-To: <20080306175239.45593120159@busybox.net>
References: <20080306175239.45593120159@busybox.net>
Message-ID: <20080306234546.GB26530@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 06, 2008 at 09:52:39AM -0800, ninevoltz at uclibc.org wrote:
> Author: ninevoltz
> Date: 2008-03-06 09:52:37 -0800 (Thu, 06 Mar 2008)
> New Revision: 21176
> 
> Log:
> some buildroot helper scripts
> 
> Added:
>    trunk/buildroot/scripts/
>    trunk/buildroot/scripts/add_new_package.wizard
>    trunk/buildroot/scripts/build-ext3-img
>    trunk/buildroot/scripts/create_ipkgs
> 
> 
> Added: trunk/buildroot/scripts/build-ext3-img
> ===================================================================
> --- trunk/buildroot/scripts/build-ext3-img	                        (rev 0)
> +++ trunk/buildroot/scripts/build-ext3-img	2008-03-06 17:52:37 UTC (rev 21176)

Why isn't this just a normal target? Or an option to the current ext2
target?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
