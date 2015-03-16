From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 23:07:25 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
In-Reply-To: <1426017584-6096-3-git-send-email-ps.report@gmx.net>
References: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
 <1426017584-6096-3-git-send-email-ps.report@gmx.net>
Message-ID: <20150316230725.6f8cbd9d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 10 Mar 2015 20:59:39 +0100, Peter Seiderer wrote:
> - overwrite platform support with linux template
> - disable spinlock support
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

postgresql uses fork(), which is not available on Blackfin:
http://autobuild.buildroot.org/results/c9c/c9c93156fe64e89f35627aa592c47d8c5181ed7d/build-end.log.

So what was the point of enabling postgresql on Blackfin ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
