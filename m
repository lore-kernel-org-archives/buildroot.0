From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jun 2013 21:50:48 +0200
Subject: [Buildroot] [RFC v2 1/1] ti-gfx: add new package
In-Reply-To: <20130626125300.057a48ca@bourban>
References: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
 <51CA0EE2.70301@mind.be> <20130626125300.057a48ca@bourban>
Message-ID: <51CB4618.5060603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/06/13 19:53, Spenser Gilliland wrote:
>>    In this particular case, I notice that Thomas repeats a lot of
>> >review comments that I've made a week ago, so writing "review
>> >comments from Arnout not taken into account" would have helped:-)  Or
>> >maybe you missed those?
> Sorry about that, they were good comments but I was just trying to get
> it functional and most of the comments were cosmetic in nature.  I'll
> get them all fixed up soon.

  No, it's perfectly OK that you repost something without already taking 
account all previously posted feedback. Just mention it in the patch 
comments.

  FYI in case you don't know, the commit message is ideally formatted as 
follows:

----------------------------------------------------
ti-gfx: new package

Anything else that should go in the git history (usually nothing for new 
packages).

Signed-off-by: You Know Who <ykw@buildroot.net>
---
Comments for the reviewers, e.g. "This is work in progress, this and that 
is still to do."

v3: modified here and there
v2: changed such and such
-----------------------------------------------------


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
