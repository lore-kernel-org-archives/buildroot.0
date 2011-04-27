From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2011 10:41:55 -0300
Subject: [Buildroot] [PATCH] libnl: bump to version 2.0
In-Reply-To: <4DB8116B.901@visionsystems.de>
References: <4DB7D29E.5000101@visionsystems.de>	<87liywylxb.fsf@macbook.be.48ers.dk>
	<4DB8116B.901@visionsystems.de>
Message-ID: <4DB81D23.8050505@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/27/11 09:51, Yegor Yefremov wrote:

>> I see there's already a libnl-3.0, is there any reason why you stick
>> with 2.0?
> 
> You're right. I first tried 3.0 and it failed by some package, so I took 2.0 and didn't verify what was wrong. But I just checked the 3.0 version and it works with all 5 packages:
> 
> wpa_supplicant
> iw
> hostapd
> kismet
> ti-utils

iw fails to build with 3.0
kismet builds without libnl support with 3.0
hostapd & wpa_supplicant build ok with your patches.
Did you make clean completely before trying? Otherwise you'll get stale
files in staging.
Regards.
