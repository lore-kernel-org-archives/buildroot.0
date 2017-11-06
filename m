From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Nov 2017 23:19:00 +0100
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
In-Reply-To: <5A005FF1.5000204@petroprogram.com>
References: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>
 <20171101105305.1cd82e60@windsurf> <59FB8C69.7050108@petroprogram.com>
 <20171102222811.4d501282@windsurf> <5A005FF1.5000204@petroprogram.com>
Message-ID: <2241958e-38c2-6075-1d08-a129e1124251@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-17 14:13, Stefan Fr?berg wrote:
> 1. TurboVNC really does depend of turbo-jpeg, that's one of the reasons it's so
> fast.
> So for now I have made it "depends on BR2_PACKAGE_JPEG_TURBO" so that turbovnc
> package will only appear to menu only if jpeg-turbo has been also selected.
> Is that okay?

 Yes, there is no other way. However, please do add a comment (separately from
the toolchain comments) that it needs jpeg-turbo.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
