From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:43:16 +0100
Subject: [Buildroot] [PATCH v3] package/libnss: fix build failure with
 ARM without NEON extension
In-Reply-To: <20191029120916.33876-1-giulio.benetti@benettiengineering.com>
References: <20191029120916.33876-1-giulio.benetti@benettiengineering.com>
Message-ID: <6317bfcd-cd73-4379-f0e6-7aa90a39ba31@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 13:09, Giulio Benetti wrote:
> At the moment libnss assumes that every ARM has NEON extension but it's
> not that way. So add a patch to make it aware of it and use native
> functions in place of NEON optimized ones.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1342d305d1aeebef7af54a83afc094fda12421e2/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

 Applied to master, thanks.

 Did you send the patch upstream?

 Regards,
 Arnout
