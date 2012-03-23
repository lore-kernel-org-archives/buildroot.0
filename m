From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Fri, 23 Mar 2012 16:37:27 +0100
Subject: [Buildroot] [PATCH v3] Add dtc (device tree compiler) as host
 tool
In-Reply-To: <20120323163218.5915f640@skate>
References: <0e9c281db61ec6c47a7a.1332513454@beantl019720>
 <20120323155103.54f93fa3@skate>
 <20120323150517.GS444@game.jcrosoft.org>
 <20120323163218.5915f640@skate>
Message-ID: <20120323153727.GT444@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16:32 Fri 23 Mar     , Thomas Petazzoni wrote:
> Le Fri, 23 Mar 2012 16:05:18 +0100,
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :
> 
> > dtc is always provuded with the kernel so why do you need it?
> 
> The sources are always available, but it is *built* only if CONFIG_DTC
> is selected. So unconditionally installing scripts/dtc/dtc will not
> work if the kernel was configured !CONFIG_DTC.
but the source is up-to-date for the kernel you use

we get this discussion on the kernel we do only expect the dtc that is
provided byt the kernel that you compile to be used. If you use other verison
we do not garanty it will work.

Best Regards,
J.
