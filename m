From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 8 Feb 2016 20:58:40 -0500
Subject: [Buildroot] [PATCH v2 05/18] erlang-rebar: bump to version 2.6.1
In-Reply-To: <56B67620.1040700@gmail.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-6-git-send-email-fhunleth@troodon-software.com>
 <56B67620.1040700@gmail.com>
Message-ID: <CA+-urNS7r99BFL-W98=gqZYa3uOxzzJTT8+tULVKh+i8+fdGKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sat, Feb 6, 2016 at 5:39 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Hi Frank, All,
>
> Le 02/02/2016 20:57, Frank Hunleth a ?crit :
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> ---
>>  package/erlang-rebar/erlang-rebar.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
>> index f29eb75..06a7800 100644
>> --- a/package/erlang-rebar/erlang-rebar.mk
>> +++ b/package/erlang-rebar/erlang-rebar.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -ERLANG_REBAR_VERSION = 2.5.1
>> +ERLANG_REBAR_VERSION = 2.6.1
>>
>>  # Upstream publishes a release, but we can not use it as it is a release of
>>  # a generated rebar script, when we want the sources. So we have to use the
>>
>
> There is an error with the variable used for licensing:
> s/ERLANG_LICENSE/ERLANG_REBAR_LICENSE/

Good catch. Will be fixed in the next patch set. 'make legal-info' now
gives no erlang related warnings or errors for me.

>
> Otherwise the license file and license type are not defined and produce a
> warning with legal-info:
>
> # WARNING: erlang-rebar: cannot save license (HOST_ERLANG_REBAR_LICENSE_FILES
> not defined)
>
> Also it override the one defined in erlang package :-/
>
> Best regards,
> Romain
