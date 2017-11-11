From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:32:44 +0100
Subject: [Buildroot] [PATCH 1/1] snmp++: security bump to v3.3.10
In-Reply-To: <20171108120033.26045-1-aduskett@gmail.com>
References: <20171108120033.26045-1-aduskett@gmail.com>
Message-ID: <20171111233244.0145995b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Nov 2017 07:00:33 -0500, Adam Duskett wrote:
> From the changelong:
> Set the FD_CLOEXEC flag on sockets, so they are not "leaked" to
> spawned processes
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/snmppp/snmppp.hash | 3 ++-
>  package/snmppp/snmppp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
