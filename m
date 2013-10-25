From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 25 Oct 2013 10:28:50 +0200
Subject: [Buildroot] [PATCH] packages/Config.in: Fix case on entries
	titles
In-Reply-To: <526A2679.1010606@mind.be>
References: <1382628930-23665-1-git-send-email-maxime.hadjinlian@gmail.com>
 <CAAXf6LXQn-Ssw13BC3VxCqQLP-c0--5RD-ZduBhZ_64LWiodgQ@mail.gmail.com>
 <526A2679.1010606@mind.be>
Message-ID: <CAGduivzWOhmCVwo1j=m5jwsQYj51+KVLLCkx-ufmYzANKQfCfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 25, 2013 at 10:06 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 25/10/13 08:27, Thomas De Schampheleire wrote:
>>
>> Hi Maxime,
>>
>> On Thu, Oct 24, 2013 at 5:35 PM, Maxime Hadjinlian
>> <maxime.hadjinlian@gmail.com> wrote:
>>>
>>> ---
>>>   package/Config.in | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/package/Config.in b/package/Config.in
>>> index ebbdeb5..8519f45 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -169,7 +169,7 @@ source "package/gnuplot/Config.in"
>>>   source "package/jhead/Config.in"
>>>   source "package/rrdtool/Config.in"
>>>
>>> -comment "graphic libraries"
>>> +comment "Graphic libraries"
>>>   source "package/cegui06/Config.in"
>>>   source "package/directfb/Config.in"
>>>   source "package/directfb-examples/Config.in"
>>> @@ -196,7 +196,7 @@ source "package/sdl_net/Config.in"
>>>   source "package/sdl_sound/Config.in"
>>>   source "package/sdl_ttf/Config.in"
>>>
>>> -comment "other GUIs"
>>> +comment "Other GUIs"
>>>   source "package/efl/Config.in"
>>>   source "package/qt/Config.in"
>>>
>>> @@ -241,7 +241,7 @@ source "package/liberation/Config.in"
>>>   source "package/libsexy/Config.in"
>>>   source "package/x11r7/xkeyboard-config/Config.in"
>>>
>>> -comment "X Window managers"
>>> +comment "X window managers"
>>>   source "package/blackbox/Config.in"
>>>   source "package/enlightenment/Config.in"
>>>   source "package/fluxbox/Config.in"
>>
>>
>> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> Maxime, when you send multiple versions of a patch, could you use v2,
>> v3, ... in the subject line (PATCH v2) to make it easier for reviewers
>
>
>  Note that you can do this with git-send-email (or format-patch):
>
> git send-email -v2   # Send out PATCH v2, requires git >= 1.8.something
> git send-email --subject-prefix 'PATCH v2'
>
Thanks, I did not know about that !
>
>  Regards,
>  Arnout
>
>> to distinghuish the different versions? Also below the changelog you
>> should put a description of the changes compared to the previous
>> version.
>> See
>> http://buildroot.uclibc.org/downloads/manual/manual.html#_patch_revision_changelog
>>
>> Also, I believe it is customary to resend the entire series when there
>> is a revision of one of its patches.
Yes, I though about sending the patch as an alone change instead of
part of a serie but it was wrong of me since this one depends on the
change introduced by the first patch.
Anyway, sorry for theses mistakes, I should have known better.

I'll wait on further comment on the first patch and resend the serie
with a changelog.
>>
>> Thanks,
>> Thomas
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
