From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 16 Nov 2013 02:02:39 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: Rename the first patch to match
 the naming policy.
In-Reply-To: <20131115104511.56ab9a97@skate>
References: <1384507838-4675-1-git-send-email-Sonic.adi@gmail.com>
 <CAAXf6LW2zFZ2OCh4G7SrPAc52hpAb0KC=HuOj=gFaA2fsTu_cg@mail.gmail.com>
 <20131115104511.56ab9a97@skate>
Message-ID: <5286C42F.3060802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/13 10:45, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 15 Nov 2013 10:39:52 +0100, Thomas De Schampheleire wrote:
>
>>>   package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch | 11 +++++++++++
>>>   package/e2fsprogs/e2fsprogs-sem-init-libs.patch      | 11 -----------
>>>   2 files changed, 11 insertions(+), 11 deletions(-)
>>>   create mode 100644 package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch
>>>   delete mode 100644 package/e2fsprogs/e2fsprogs-sem-init-libs.patch
>>
>> Also here I wonder why git/git-format-patch did not recognize the move?
>
> Because you need to explicitly do a 'git format-patch -M', or configure
> Git in your ~/.gitconfig to enable rename detection permanently.

  But anyway it doesn't really matter, since git-repack will convert it 
into a proper rename. It just makes the patch on the list shorter and 
easier to review.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
