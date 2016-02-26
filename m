From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 26 Feb 2016 23:08:18 +0100
Subject: [Buildroot] [PATCH v3 2/2] docs/manual: add section about patch
 licensing
In-Reply-To: <20160225201602.GC5870@free.fr>
References: <1456401075-16948-1-git-send-email-luca@lucaceresoli.net>
 <1456401075-16948-3-git-send-email-luca@lucaceresoli.net>
 <20160225201602.GC5870@free.fr>
Message-ID: <56D0CCD2.7040201@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

On 25/02/2016 21:16, Yann E. MORIN wrote:
> Luca, All,
> 
> On 2016-02-25 12:51 +0100, Luca Ceresoli spake thusly:
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Cc: Peter Korsgaard <peter@korsgaard.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Steve Calfee <stevecalfee@gmail.com>
>>
>> ---
>>
>> Note: although there are only wording improvements since v2, I did not
>> carry the Acked-by from Thomas and Arnout because the topic is
>> delicate and Yann explicitly nacked the patch.
> 
> IIRC, I NAKed it because, in case of proprietary packages, the patches
> can only be available under the FLOSS license of the package they are
> applied to.

Yup. I hurried to resend the previous patch (affecting COPYING) and
didn't quite address your comments on this one. Sorry about that, I did
it just now.

> 
> [--SNIP--]
>> +==== Patches to packages
>> +
>> +Buildroot is bundled with a set of patches that are applied to
>> +packages to fix cross-compilation or other issues. See
>> +xref:patch-policy[] for the technical details.
>> +
>> +These patches are effectively a derived work of the package they are
>> +applied to, and so they are released under the same license as the
>> +software they apply to. They are not distributed under the Buildroot
>> +license.
> 
> Why not repeat the same sentence as the one from the previous patch?

Because this is the manual, and I wanted it to be less legalese and more
humanese/hackerese... and I felt like explaining the reason ("patches
are effectively a derived work...").

But your suggestion is quite good, and it definitely ensures the manual
doesn't contradict COPYING! :) And actually they mostly state the same
things, only in a different order and with different wording.

Unless others suggest differently, I'll take your suggestion for v4.

-- 
Luca

-- 
Luca
