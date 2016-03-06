From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 6 Mar 2016 23:52:09 +0100
Subject: [Buildroot] [PATCH 2/2] legal-info: remove outdated comment
In-Reply-To: <20160306101914.GB3501@free.fr>
References: <1457134753-28197-1-git-send-email-luca@lucaceresoli.net>
 <1457134753-28197-2-git-send-email-luca@lucaceresoli.net>
 <20160306101914.GB3501@free.fr>
Message-ID: <56DCB499.1020406@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

On 06/03/2016 11:19, Yann E. MORIN wrote:
> Luca, All,
> 
> On 2016-03-05 00:39 +0100, Luca Ceresoli spake thusly:
>> This comment is outdated since the assignment of $(2)_MANIFEST_TARBALL
>> and $(2)_MANIFEST_SITE have been removed, which happened in
>> b9f4727ff4d512868352494f5209fff4da147473.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> ---
>>  package/pkg-generic.mk | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 9ea2a707baa4..189ccf8c8415 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -754,8 +754,7 @@ $(1)-legal-info: $(1)-patch
>>  endif
>>  
>>  # We only save the sources of packages we want to redistribute, that are
>> -# non-local, and non-overriden. So only store, in the manifest, the tarball
>> -# name of those packages.
>> +# non-local, and non-overriden.
> 
> I wondered why you kept 'local' here, but then I remembered that we
> handle 'local' packages as if they were overriden. I think that's
> inherently bad that we do that, but this is not the purpose of your
> patch.
> 
> Still, I would prefer something like:
> 
>     ... that are non-overriden (local or true override).
> 
> otherwise:
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> BTW, you're not making my life easy: I'll have to rebase my own legal
> series over that, and I expect quite a bunch of conflicts! ;-)

Although I'm trying hard to make your life more difficult, I'm afraid
I'm not succeding! :-)

Seriously speaking, your legal series in its v4 cleanly rebases on top
of the present patch.

-- 
Luca
