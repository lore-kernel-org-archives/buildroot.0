From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jan 2014 08:47:52 +0800
Subject: [Buildroot] [PATCH] libnfc-llcp: rename to libllcp and bump
 version
In-Reply-To: <52CF8D87.20000@mind.be>
References: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
 <52CF8D87.20000@mind.be>
Message-ID: <20140111084752.50fe9b83@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jan 2014 07:04:55 +0100, Arnout Vandecappelle wrote:
> On 09/01/14 18:07, Vicente Olivert Riera wrote:
> > This package has been renamed upstream to libllcp.
> 
>   This is not sufficient reason to rename the package in buildroot as 
> well. Renaming makes it difficult for people to follow buildroot upstream 
> with their configurations.

True, but having packages in Buildroot that progressively do not follow
the upstream names of the packages is also going to be big mess, as we
are going to have more and more of such packages.

Since we have the Config.in.legacy thing in place, I'd very much prefer
to rename packages to follow upstream decisions.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
