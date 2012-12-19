From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Dec 2012 23:49:40 +0100
Subject: [Buildroot] [PATCH 1/4] libglib2: bumped version to 2.32.4
In-Reply-To: <20121219202217.34f0959f@skate>
References: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
 <20121219202217.34f0959f@skate>
Message-ID: <50D24484.8010001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/12/12 20:22, Thomas Petazzoni wrote:
> Dear bogdan at nimblex.org,
>
> On Wed, 19 Dec 2012 16:58:41 +0000, bogdan at nimblex.org wrote:
>> From: Sven Neumann<s.neumann@raumfeld.com>
>>
>> Bump libglib2 to a newer stable version.
>>
>> There are a few changes to the configure options necessary
>> in order to make it compile cleanly and work correctly.
>> The patch has been tested on ARM and i486. Some things
>> might have to be adjusted for other platforms.
>>
>> Signed-off-by: Sven Neumann<s.neumann@raumfeld.com>
>> ---
>>   ...b2-make-codegen-python2-python3-compliant.patch | 192 ---------------------
>
> Could you justify why this patch is no longer needed?

  Are you serious? The second line of the patch says:
"This patch is already included upstream, from the glib-2.32.4 release."


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
