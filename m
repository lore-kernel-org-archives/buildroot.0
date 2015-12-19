From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Dec 2015 15:12:16 +0100
Subject: [Buildroot] [PATCH 10/12] package/x11r7/xserver_xorg-server:
 bump version to 1.18.0
In-Reply-To: <20151219141714.5da170a3@free-electrons.com>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
 <1450522892-14611-10-git-send-email-bernd.kuhls@t-online.de>
 <20151219141714.5da170a3@free-electrons.com>
Message-ID: <567565C0.4090902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-12-15 14:17, Thomas Petazzoni wrote:
> Dear Bernd Kuhls,
> 
> Adding Arnout in Cc, since he is our legacy handling expert :)
> 
> On Sat, 19 Dec 2015 12:01:30 +0100, Bernd Kuhls wrote:
>> - added legacy handling for BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
> 
> Is this really needed? In any case, without legacy handling, the thing
> will automatically fall back to version 1.18, which is what we want. So
> I'm questioning whether legacy handling is needed.

 I would normally say that we should still have legacy handling here, to draw
people's attention to the fact that something in the .config changed. However,
it's just a change of version, and versions are changing all over the place, so
indeed legacy handling isn't needed here.


 Regards,
 Arnout

> 
>> - legacy handling for BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
>>   is not needed because this option is not used by other packages
> 
> BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19 is a blind option, so
> there is no point in adding legacy handling for it.
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
