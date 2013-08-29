From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 29 Aug 2013 13:24:04 -0500
Subject: [Buildroot] [PATCH 6/6] glmark2: new package
In-Reply-To: <521EDD9C.6040408@mind.be>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-7-git-send-email-spenser@gillilanding.com>
 <521B93DB.8010401@mind.be>
 <CAEBucnCyw7VBjmP1nMwQ1qC1jgcn3=m93B1SY6frdqWuTdW=QA@mail.gmail.com>
 <521EDD9C.6040408@mind.be>
Message-ID: <CAEBucnBUe1x3r8W=wYH9_hoMR1GZR2ejuZRkXw=udz+qtH7pnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 29, 2013 at 12:35 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/27/13 21:01, Spenser Gilliland wrote:
>>
>> Arnout,
>>
>> Thanks for the review.  I appreciate your suggestions.
>>
>> On Mon, Aug 26, 2013 at 12:43 PM, Arnout Vandecappelle<arnout@mind.be>
>> wrote:
>>>
>>> >On 08/24/13 21:42, Spenser Gilliland wrote:
>>>>
>>>> >>
>>>> >>Signed-off-by: Spenser Gilliland<spenser@gillilanding.com>
>>>> >>---
>>>> >>   package/Config.in                                  |   1 +
>>>> >>   package/glmark2/Config.in                          |  49 ++++++++++
>>>> >>   package/glmark2/glmark2-add-mali-support.patch     | 102
>>>> >>+++++++++++++++++++++
>>>> >>   package/glmark2/glmark2-fix-add-GLchar.patch       |  17 ++++
>>>> >>   .../glmark2-gl-to-glesv2-on-drm-flavor.patch       |  25 +++++
>>>> >>   package/glmark2/glmark2.mk                         |  70
>>>> >> ++++++++++++++
>>>> >>   6 files changed, 264 insertions(+)
>>>> >>   create mode 100644 package/glmark2/Config.in
>>>> >>   create mode 100644 package/glmark2/glmark2-add-mali-support.patch
>>>> >>   create mode 100644 package/glmark2/glmark2-fix-add-GLchar.patch
>>>> >>   create mode 100644
>>>> >>package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch
>>>
>>> >
>>> >
>>> >  Have these patches been sent upstream?
>>
>> Not yet.  I was planning to wait until these patches were committed
>> before submitting them upstream.
>
>
>  It's a better idea to send them right away. The buildroot people are not
> ideally placed to review those patches, so you may get more useful feedback
> from upstream. Also, if upstream is fast enough to review the patches, you
> can still make modifications to the patch included in buildroot.

They have been sent.  Awaiting review using launchpad see
https://code.launchpad.net/~spenser-gilliland/glmark2/mali-fbdev .

>  Regards,
>  Arnout
>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

Regards,
Spenser


-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
