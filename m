From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 18 Sep 2008 13:20:04 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
In-Reply-To: <20080918110827.E4B493C664@busybox.net>
References: <20080918110827.E4B493C664@busybox.net>
Message-ID: <20080918132004.375ef460@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Sep 2008 04:08:27 -0700 (PDT)
egtvedt at uclibc.org wrote:

> Author: egtvedt
> Date: 2008-09-18 04:08:27 -0700 (Thu, 18 Sep 2008)
> New Revision: 23425
> 
> Log:
> iptables: fix install rule to install everything in appropriate
> directories
> 
> This patch will install iptables with the install-strip command, and
> also use /usr/lib as target for the filter libraries.
> 

Sorry, this log message is not entirely accurate, the old
install-exec-am did not install the filter libraries at all. Thus
iptables did not work.

<snipp patch>

-- 
Best regards,
Hans-Christian Egtvedt
