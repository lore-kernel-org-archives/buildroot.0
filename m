From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 26 Feb 2016 23:08:27 +0100
Subject: [Buildroot] [PATCH v2 4/5] docs/manual: add section about patch
 licensing
In-Reply-To: <20160203233430.GC3428@free.fr>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-5-git-send-email-luca@lucaceresoli.net>
 <20160203233430.GC3428@free.fr>
Message-ID: <56D0CCDB.9020302@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

On 04/02/2016 00:34, Yann E. MORIN wrote:
[...]
>> +==== Patches to packages
>> +
>> +Buildroot is bundled with a set of patches that it applies to packages
> 
> ... that are applied to...
> 
>> +to fix cross-compilation or other issues. See xref:patch-policy[] for
>> +the technical details.
>> +
>> +These patches are effectively a derived work of the upstream package,
> 
> ... a derived work of the package they are applied to...
> 
>> +and they are released under the same license as the software they
> 
> and so are released...
> 
>> +apply to.
> 
> So, we still have the problem of patches that are applied to packages
> that can be had under a non-public license, like e.g. Qt, polarssl...
> for which there exists a proprietary alternative?
> 
> In my opinion, the patches we carry are only available under the FLOSS
> license we can get them:
> 
>   - if we cherry-picked them from upstream, then the only license we
>     ever had for those patches is the FLOSS license, not the proprietary
>     one; so they can't be applied to the proprietary version of the
>     package (but a licensee may get those patches from the licensor, and
>     replace our patches with the ones it got from the licensor);
> 
>   - if we wrote them, the only solution we have is to make them public
>     domain, or they could not be applied either (we don't know the
>     licensing terms for that proprietary version, so we can't license
>     them under those terms);

Why can't we license these patches under the FLOSS license they are
publicly available under? Of course this implies "they can't be applied
to the proprietary version of the package", just like you state in the
first case. This is a limitation, but I think it is legal. Don't you
think so?

> 
>   - if we got them from somewhere else (e.g. openwrt, gentoo,
>     alpine...), then we'd have to get the licensing terms from those
>     providers, and I guess most of them either don't know (most
>     probable) or would only provide them under the usual FLOSS license
>     of that package (not knowing better than us in points 1 and 2 above).
> 
> So, this situation is really complex, and we can't deal with that in
> such a simple way.
> 
>> They are not distributed under the Buildroot license.
> 
> Well, what of a patch to a GPLv2 package? It is the same license as
> Buidlroot's license... What I mean, is that some patches might be
> covered by the same licensing terms, but that it's not because of
> Buildroot, but because of the package they are applied to. I'd like we
> make that clearer...

Aaaah, yes, you're right... Well, I guess we all got what I meant, but
indeed I wrote something ambiguous. :(

-- 
Luca

-- 
Luca
