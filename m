From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2009 09:58:45 +0200
Subject: [Buildroot] Bug 171 - vm86.c error: IF_MASK undeclared
In-Reply-To: <98531B0C-B641-406E-A66F-04C837AF6A90@earthlink.net>
References: <98531B0C-B641-406E-A66F-04C837AF6A90@earthlink.net>
Message-ID: <20090728095845.40fed62a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 27 Jul 2009 16:34:13 -0400,
Steve Bennett <sablists@earthlink.net> a ?crit :

> https://bugs.busybox.net/show_bug.cgi?id=171
> 
> I just ran into this problem, and worked around it by updating the  
> patch file (below) so it points to the right files, and putting it
> in my package/x11r7/xserver_xorg-server folder.
> 
> That said, I was wondering if there's a different fix, some package  
> or header I'm missing or something, since it seems like a fairly old  
> problem.

Thanks for the report. To handle this, I will bump the X.org server
version to 1.5.3, which contains the fix for this issue.

I'll do a test-compile+run of 1.5.3 and send the pull request for this.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
