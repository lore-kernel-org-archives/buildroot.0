From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Oct 2012 11:20:04 +0200
Subject: [Buildroot] [PATCH] New package liblog4c-localtime
In-Reply-To: <50768EA2.7010101@mail.ru>
References: <1349679414-2967-1-git-send-email-fenixk19@mail.ru>
 <5074893E.2030600@mind.be> <50768EA2.7010101@mail.ru>
Message-ID: <50768F44.2030607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/12 11:17, Alexander Varnin wrote:
> 10.10.2012 00:29, Arnout Vandecappelle ?????:
>> + $(eval $(call AUTOTARGETS))
> Will this line work on newer versions of buildroot?

  No it won't, but Thomas already gave that comment so I didn't repeat it.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
