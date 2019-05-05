From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon, 6 May 2019 01:50:34 +0200
Subject: [Buildroot] [PATCH] package/libglib2: avoid printing null
 strings
In-Reply-To: <87k1f4bu2t.fsf@dell.be.48ers.dk>
References: <20190504194415.1121-1-grzegorz@blach.pl>
 <87k1f4bu2t.fsf@dell.be.48ers.dk>
Message-ID: <AAC0C514-6AC9-46D5-9321-0C96B769EAEC@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 5 May 2019, at 21:05, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>>>>> "Grzegorz" == Grzegorz Blach <grzegorz@blach.pl> writes:
> 
>> GCC 9 is being stricter about passing null string pointers
>> to printf-like functions.
> 
>> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> 
>> ---
>> Changes v1 -> v2:
>>  - Patch taken from glib repository has been signed off by me.
> 
> check-package still complains:
> 
> package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch:4: generate your patches with 'git format-patch -N'
> 
> Committed with that fixed, thanks.

Thanks. Please, commit this patch to the 2019.02.x branch too.
