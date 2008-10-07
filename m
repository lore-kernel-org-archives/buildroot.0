From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 7 Oct 2008 16:51:34 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/vsftpd
In-Reply-To: <20081006224641.F0B81F8008@busybox.net>
References: <20081006224641.F0B81F8008@busybox.net>
Message-ID: <20081007055134.GF5127@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 06, 2008 at 03:46:41PM -0700, wberrier at uclibc.org wrote:
> Added: trunk/buildroot/package/vsftpd/vsftpd-init
> ===================================================================
> --- trunk/buildroot/package/vsftpd/vsftpd-init	                        (rev 0)
> +++ trunk/buildroot/package/vsftpd/vsftpd-init	2008-10-06 22:46:41 UTC (rev 23611)

Too bad this can't be disabled - as soon as this package is installed
the init script will be run on boot. Some users may not want this.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
