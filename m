From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Apr 2015 22:45:42 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/swupdate: new package
In-Reply-To: <1429644803.4366.2.camel@embedded.rocks>
References: <1429576251-28975-1-git-send-email-joerg.krause@embedded.rocks>
 <CANPyyuM0mRYTZ+1qEyDf+C83-B-=wOm0Vn__xxaVfFxvq663rA@mail.gmail.com>
 <1429644803.4366.2.camel@embedded.rocks>
Message-ID: <5536B6F6.7070708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/04/15 21:33, J?rg Krause wrote:
> Hi Mike,
> 
> On Di, 2015-04-21 at 09:49 -0400, Mike Williams wrote:
>> This now depends on lua, which is an optional dependency for swupdate
>> (I don't use it).
> 
> This was suggested by Arnout to reduce the configuration complexity:
> https://patchwork.ozlabs.org/patch/451763/

 The idea is to have *some* swupdate support in buildroot now, and we can still
improve it later.

 So a follow-up patch that gets rid of lua is certainly welcome!

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
