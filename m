From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 6 Feb 2015 15:51:03 +0100
Subject: [Buildroot] board-specific autotools env customization
In-Reply-To: <54D49C45.40206@mind.be>
References: <CAKAx1chT6Grx+oRMiQy5t29TUe=avo6v9CR2nP1GZ6Lf1-a-5A@mail.gmail.com>
 <20150202175455.5dd5c2e3@free-electrons.com>
 <CAKAx1ciLEADv9bnxzLh-2m9hvuaVUnvWZcKqyGMRwBOaQVhLWQ@mail.gmail.com>
 <54D08CB7.7040801@mind.be>
 <CAKAx1cg32iH0XEby8hPoQq1nm2DutdtDROE5nBWsXMi1mO93qg@mail.gmail.com>
 <54D27F46.6030704@mind.be>
 <CAKAx1ci_E5=kba_kR8KLt==Q7b_8mKoTeeY=t_XtZ3_x0yh-_g@mail.gmail.com>
 <54D49C45.40206@mind.be>
Message-ID: <CAKAx1cidhE+VkH95QxO4e1rHagCx2KxMBa6FOUS_i-Hv=V36mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Feb 6, 2015 at 11:49 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/02/15 10:31, Lionel Orry wrote:
> [snip]
>> Thank you Arnout for your valuable help. I sent a patch to the
>> mailing-list, and I am preparing the patch for upstream.
>> I have to adapt it for the current upstream master version (v.4.2.x)
>> because acinclude.m4 changed, so I can't send it as-is...
>> Should I try to send the v4.0.x based patch to their maintenance
>> branch ? They say it's for bugfixes only so I'm pretty sure it will be
>> rejected.
>
>  Sending to the upstream maintenance branch isn't very useful.
>
>  Sending an adapted patch to buildroot like you did is OK. But perhaps it's more
> useful to bump the buildroot version. Yes, we're trying to squeeze as much
> contribution out of you as we can :-)

Well I created a pull request on upstream dev branch which was
accepted and merged a few minutes later. I'm glad they are so
responsive.

But they are in the process of stabilizing zeromq v4.1.0 (they are in
RC currently) and I'm afraid this code won't be merged there, so we
will have to wait for another late release before dropping the patch
from buildroot...

>
>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

Regards
Lionel
