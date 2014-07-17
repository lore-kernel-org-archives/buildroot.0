From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 23:07:40 +0200
Subject: [Buildroot] [PATCH 4/7 v3] package/powerpc-utils: Add powerpc
 hardware utilities
In-Reply-To: <1402982507.185290.70487867379.4.gpush@pablo>
References: <1402982507.183937.570365596242.0.gpush@pablo>
 <1402982507.185290.70487867379.4.gpush@pablo>
Message-ID: <20140717230740.4a4c5123@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

On Tue, 17 Jun 2014 13:21:47 +0800, Jeremy Kerr wrote:
> This change adds a package definition for the powerpc-utils project,
> containing a set of powerpc-specific hardware management utilities.
> 
> We're using a git tag from upstream, which contains a few build-system
> fixes.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Thanks, applied with minor changes, as outlined in the commit log:

    [Thomas:
     - Add dependency on PowerPC architecture in Config.in.
     - Add homepage in Config.in help text.]
    
Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
