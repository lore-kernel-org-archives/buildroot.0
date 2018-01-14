From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jan 2018 15:10:14 +0100
Subject: [Buildroot] [PATCH v3] kvm-unit-tests: test for rdseed/rdrand
In-Reply-To: <1515810071-10003-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1515810071-10003-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180114151014.190e0ac5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jan 2018 20:21:11 -0600, Matt Weber wrote:
> The build fails when the host binutils isn't at least 2.23
> (2.22.x introduced RDSEED).
> 
> The host toolchain is used for x86_64 target builds where
> we need to do a 32bit build. Most other buildroot builds
> are using a much newer binutils unless it's a external
> older toolchain.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/
> 
> Upstream:
> https://marc.info/?l=kvm&m=151580743523259&w=2
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---

This one worked fine, so: applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
