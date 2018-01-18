From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 14:04:10 +0100
Subject: [Buildroot] [PATCH] rpcbind: fix attempt to free non-dynamic
 memory
In-Reply-To: <bec65fd2-d926-6ebf-5ab9-5e0c93b03ae3@sondrel.com>
References: <20180117100858.30401-1-ed.blake@sondrel.com>
 <20180117141318.7d337f52@windsurf>
 <bec65fd2-d926-6ebf-5ab9-5e0c93b03ae3@sondrel.com>
Message-ID: <20180118140410.67411c34@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jan 2018 12:04:09 +0000, Ed Blake wrote:

> >> Change-Id: I7fc34efd58408ec5e626da8edd08aa697ed8b936
> >> Signed-off-by: Ed Blake <ed.blake@sondrel.com>  
> > Thanks. Is this fix-for-the-fix in the upstream rpcbind project ? If
> > not, did you submit it ?  
> 
> So it looks like this was already fixed here:
> 
> http://git.linux-nfs.org/?p=steved/rpcbind.git;a=commit;h=7c7590ad536c0e24bef790cb1e65702fc54db566
> 
> So I should just submit that as a patch file to buildroot?

Yes. git format-patch this commit, adds your Signed-off-by, and put the
patch in package/rpcbind/.

> I guess we should also apply this at the same time:
> 
> http://git.linux-nfs.org/?p=steved/rpcbind.git;a=commit;h=c49a7ea639eb700823e174fd605bbbe183e229aa

Indeed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
