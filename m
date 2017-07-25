From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:23:02 +0200
Subject: [Buildroot] [PATCH 1/1] paxtest: use RUNDIR
In-Reply-To: <1500774783-21428-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1500774783-21428-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170725222302.7dfa32c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Jul 2017 20:53:03 -0500, Matt Weber wrote:
> RUNDIR installs the test applications and shared libraries
> into a different folder then /usr/lib.  This is desired as
> there are a lot of test apps which would get installed into
> /usr/lib without organization.  Instead, set RUNDIR=/usr/lib/paxtest
> to install the test apps and libraries in a sub folder.
> The genpaxtest script accounts for this path and handles
> a LD_LIBRARY_PATH update as part of the paxtest script's exeuction.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/paxtest/paxtest.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
