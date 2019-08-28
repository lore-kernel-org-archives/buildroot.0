From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 14:37:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/hostapd: security bump version
 to 2.9
In-Reply-To: <c73afac5-6fdf-d8df-b48e-1192c2730234@mind.be> (Arnout
 Vandecappelle's message of "Wed, 28 Aug 2019 09:39:54 +0200")
References: <20190825192843.21655-1-bernd.kuhls@t-online.de>
 <995d10a8-0c25-8911-f8b5-8b65ffd60987@mind.be>
 <877e6yjp1v.fsf@dell.be.48ers.dk>
 <c73afac5-6fdf-d8df-b48e-1192c2730234@mind.be>
Message-ID: <87d0gpqxda.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Anybody with more wifi knowledge (Arnout?) that disagrees?

 >  EAP-PWD is probably not used in wifi, but it might be used in practice in
 > 802.1X setups. But 802.1X is so rare in general that I doubt that any buildroot
 > user is actually using this.

 >  So, I would say the SAE use case is the relevant one. And for SAE, the simple
 > workaround is not to enable groups 28-30 in the runtime configuration.

 >  And I definitely agree that the 2.9 bump is too big to take in master (and
 > definitely LTS). So for master and LTS, I would just add a release not entry
 > with the workaround.

Ok, so I'll apply the two security bumps to next.

-- 
Bye, Peter Korsgaard
