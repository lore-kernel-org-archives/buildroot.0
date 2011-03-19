From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2011 08:29:09 +0100
Subject: [Buildroot] [Solved] Re:  ntpdate takes a long time
In-Reply-To: <AANLkTin6eLoEyqOri=01+55AeDzQhw3MNg=0WZyCo28g@mail.gmail.com>
References: <AANLkTi=PdnH5wLpD+F1pmWwf0jNc_baRBGbr70RAtVXT@mail.gmail.com>
	<201103180953.21819.minimod@morethan.org>
	<AANLkTin6eLoEyqOri=01+55AeDzQhw3MNg=0WZyCo28g@mail.gmail.com>
Message-ID: <20110319082909.023d3e35@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Mar 2011 15:34:36 +0000
bruce bushby <bruce.bushby@gmail.com> wrote:

> Apologies Michael....I think it got mixed up and pasted the results
> while still running over "ppp0"
> 
> It appears the issue is caused by "ntp", I reverted my ntp package
> version to "4.2.6p1" and now it works fine.
> 
> The results below show the same commands from:
> Linux Desktop
> Embedded running ntp-4.2.6p3 (broken)
> Embedded running ntp-4.2.6p1 (working)

Sorry, but we can't consider this problem as solved: it seems that the
version currently packaged in Buildroot has an issue. Every other user
of the version packaged in Buildroot might face the same problem.

Could you post a bug at http://bugs.ntp.org/ detailing your problem, so
that maybe the NTP developers can find out what's going wrong ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
