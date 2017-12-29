From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 22:37:48 +0100
Subject: [Buildroot] [PATCH 3/4] hostapd: make ACS dependent on nl80211
In-Reply-To: <20171223190617.3981-4-alexander.i.mukhin@gmail.com>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
 <20171223190617.3981-4-alexander.i.mukhin@gmail.com>
Message-ID: <20171229223748.5dd69cd3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Dec 2017 22:06:16 +0300, Alexander Mukhin wrote:
> ACS is supported for nl80211 driver only.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

Could you add more details here? Do you see a build failure? Runtime
failure?

If CONFIG_ACS=y doesn't build when CONFIG_DRIVER_NL80211 is disabled,
then this fix should be part of PATCH 2/4, otherwise PATCH 2/4
introduces a build regression.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
