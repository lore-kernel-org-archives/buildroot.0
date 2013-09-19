From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 21:07:42 +0200
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about
 depending on toolchain options
In-Reply-To: <CAAXf6LXtiSyVejwF_ZyW3qjzy8CS_n+0Xgj84MGFa-6kk+MggA@mail.gmail.com>
References: <patchbomb.1379494893@argentina>
 <89b40887c8268e316399.1379494896@argentina> <523A23E0.4040602@mind.be>
 <CAAXf6LXtiSyVejwF_ZyW3qjzy8CS_n+0Xgj84MGFa-6kk+MggA@mail.gmail.com>
Message-ID: <523B4B7E.9070204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/13 09:23, Thomas De Schampheleire wrote:
> Arnout, all,
>
> On Thu, Sep 19, 2013 at 12:06 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> [..]
>>
>>   For the 'dynamic library' option, I don't think it's that important to add
>> a comment for it. It's so exotic, and you probably select only very few
>> packages in that case anyway, so the likelihood of someone encountering that
>> situation is pretty slim.
>>
>
> Well, I think this depends on the semantics of PREFER_STATIC_LIB or
> the way we will handle the dynamic library option(s) in the future. If
> there is really an option that says 'I want static libs', then I think
> it makes sense to add a comment, because it's a user choice. If the
> linking is only based on the architecture supporting it or not, and
> the user will get dynamic libs when supported, then a comment is not
> needed.
>
> Based on the discussion so far, I don't think we should try to fix the
> situation in the context of this patchset, but rather in a separate
> one. I would therefore propose, for this patchset, to keep the current
> situation and the documentation as proposed in the patch. Later, any
> needed changes can be made when the dynamic library handling is
> cleared out. In the mean time, I will not add new comments for
> packages that depend on !STATIC but do not yet have a comment, as this
> may be wasted effort.
>
> What do you think?

  Good idea.

  Regards,
  Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
