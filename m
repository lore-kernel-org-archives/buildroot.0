From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Apr 2021 10:44:26 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/wpa_supplicant: handle
 CONFIG_CTRL_IFACE carefully
In-Reply-To: <606433e8-9626-09a8-2d1b-4a85065f91da@mind.be> (Arnout
 Vandecappelle's message of "Wed, 7 Apr 2021 09:32:47 +0200")
References: <20210403022316.8719-1-tianyuanhao@aliyun.com>
 <20210403070130.GN24043@scaer>
 <60bc4344-1e6d-f264-8449-2e44ee787526@aliyun.com>
 <f768f65b-c4e3-89ea-60e7-37e1a68012bb@mind.be>
 <87ft02eey8.fsf@dell.be.48ers.dk>
 <606433e8-9626-09a8-2d1b-4a85065f91da@mind.be>
Message-ID: <87y2ducwlx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> We only added disabling logic post-2021.02, so it only affects master.
 >> 
 >> Should the disabling logic (and this patch) be backported to 2021.02.x?

 >  I applied it to next at the time, not to master, so I guess that was for a
 > reason :-)

 >  I don't like putting this kind of risky changes on the stable branch. Since a
 > follow-up patch was needed, it clearly was indeed risky. The first patch of that
 > series was kind of a fix because it made sure that the wpa_supplicant build
 > actually corresponds to the Buildroot configuration. The patch that introduced
 > the CTRL_IFACE issue however was really a feature patch.

 >  So no, no backporting needed.

Ok, good.

-- 
Bye, Peter Korsgaard
