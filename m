From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 18:26:38 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/batman-adv: fix compile with
 BR2_PACKAGE_BATMAN_ADV_BATMAN_V disabled
In-Reply-To: <20210314223207.13460-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 14 Mar 2021 23:32:06 +0100")
References: <20210314223207.13460-1-ps.report@gmx.net>
Message-ID: <874kh1pyr5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The given 'CONFIG_BATMAN_ADV_BATMAN_V=' is enough to trigger the wrong
 > code compile path in net/batman-adv/bat_v.h missing the static inline
 > dummy implementations.

 > Fixes:

 >   ERROR: modpost: "batadv_v_mesh_free" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
 >   ERROR: modpost: "batadv_v_mesh_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
 >   ERROR: modpost: "batadv_v_hardif_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
 >   ERROR: modpost: "batadv_v_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
