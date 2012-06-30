From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jun 2012 21:07:58 +0200
Subject: [Buildroot] [PATCH 0/3] Document use of local sources for
	packages
In-Reply-To: <20120618085033.6d612d8a@skate>
References: <1339970041-17398-1-git-send-email-ntl@pobox.com>
 <20120618085033.6d612d8a@skate>
Message-ID: <4FEF4E8E.8030800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/18/12 08:50, Thomas Petazzoni wrote:
> Le Sun, 17 Jun 2012 16:53:58 -0500,
> Nathan Lynch<ntl@pobox.com>  a ?crit :
>
>> Since the 2011.11 release Buildroot has supported building packages
>> from local sources, but the manual has not reflected this well.  This
>> series is an attempt to address that.  I relied on Thomas Petazzoni's
>> description of the "file" and "local" methods here:
>>
>> http://free-electrons.com/blog/buildroot-2011-11/
>>
>> Nathan Lynch (3):
>>    docs: update LIBFOO_SITE to describe use of filesystem paths
>>    docs: rework LIBFOO_SITE_METHOD documentation
>>    docs: describe "file" and "local" methods in LIBFOO_SITE_METHOD
>>
>>   docs/manual/adding-packages-gentargets.txt |   77 +++++++++++++++++++---------
>>   1 file changed, 52 insertions(+), 25 deletions(-)
>
> Acked-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
>
> for the three patches.

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
for the three patches.

  I would like to see documentation updates get merged more easily. It's likely
they create conflicts with other documentation updates, so other documentation
updates are basically stalled until they are merged.  And the risk of breaking
things is rather small.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
