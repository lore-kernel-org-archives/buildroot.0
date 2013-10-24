From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 24 Oct 2013 16:13:51 +0200
Subject: [Buildroot] [PATCH 2/2] packages/Config.in: Fix case on entries
	titles
In-Reply-To: <CAAXf6LUHPB41sQNxAEt3mE0vMmyqr7DTUtU-akgMU9dSbZuY0A@mail.gmail.com>
References: <1382620587-22563-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1382620587-22563-2-git-send-email-maxime.hadjinlian@gmail.com>
 <CAAXf6LUHPB41sQNxAEt3mE0vMmyqr7DTUtU-akgMU9dSbZuY0A@mail.gmail.com>
Message-ID: <CAGduivxzJhfu4ROtyGdN97+-2DJFj0PRZL4Ky3rEYXcgAXqQQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 24, 2013 at 3:26 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Maxime,
Hi Thomas,
>
> On Thu, Oct 24, 2013 at 3:16 PM, Maxime Hadjinlian
> <maxime.hadjinlian@gmail.com> wrote:
>> ---
>>  package/Config.in | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index ebbdeb5..b1ceb16 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -169,7 +169,7 @@ source "package/gnuplot/Config.in"
>>  source "package/jhead/Config.in"
>>  source "package/rrdtool/Config.in"
>>
>> -comment "graphic libraries"
>> +comment "Graphic libraries"
>>  source "package/cegui06/Config.in"
>>  source "package/directfb/Config.in"
>>  source "package/directfb-examples/Config.in"
>> @@ -241,7 +241,7 @@ source "package/liberation/Config.in"
>>  source "package/libsexy/Config.in"
>>  source "package/x11r7/xkeyboard-config/Config.in"
>>
>> -comment "X Window managers"
>> +comment "X window managers"
>>  source "package/blackbox/Config.in"
>>  source "package/enlightenment/Config.in"
>>  source "package/fluxbox/Config.in"
>> --
>
> There is also a 'other GUIs' entry. Any reason why you did not change
> that to 'Other GUIs' ?
>
I missed it. I'll fix this and send this patch alone again.

> Best regards,
> Thomas
