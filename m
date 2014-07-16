From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Jul 2014 00:47:39 +0200
Subject: [Buildroot] [PATCH 0/3] Make exim more configurable
In-Reply-To: <53C63CD6.6020104@lucaceresoli.net>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>	<20140715213125.1b848b48@free-electrons.com>
 <20140716102439.2bcff4ce@free-electrons.com>
 <53C63CD6.6020104@lucaceresoli.net>
Message-ID: <53C7010B.40608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/07/14 10:50, Luca Ceresoli wrote:
> Another option is:
> 
>   4/ Remove BR2_PACKAGE_EXIM_CUSTOM_CONFIG knob and make exim use the
>      custom configuration only if
>      BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE != "". I assume the
>      autobuilders never set BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE, do
>      they?

 That's the approach I prefer in general, as I also mentioned in a different thread.

 Perhaps we should standardize on this approach for new patches?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
