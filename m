From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 10 Apr 2008 08:33:25 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
In-Reply-To: <20080409073513.408C43C436@busybox.net>
References: <20080409073513.408C43C436@busybox.net>
Message-ID: <20080409223324.GB4582@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 09, 2008 at 12:35:13AM -0700, nkukard at uclibc.org wrote:
> Author: nkukard
> Date: 2008-04-09 00:35:12 -0700 (Wed, 09 Apr 2008)
> New Revision: 21679
> 
> Log:
> * Removed dropbear init patch
> * Added dropbear init script
> * Added more verbose messages about key generation
> 
> 
> Added:
>    trunk/buildroot/package/dropbear/S50dropbear

How about a configuration item to control installation of the init
script? I want to start dropbear from inetd instead.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
