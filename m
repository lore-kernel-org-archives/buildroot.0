From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2019 21:53:16 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: add help for show-targets
 command
In-Reply-To: <20190812224352.117984ed@windsurf.home>
References: <20190812194758.1287-1-vadim4j@gmail.com>
 <20190812224352.117984ed@windsurf.home>
Message-ID: <5d47bf77-af6e-ac05-c709-5f41a99e2500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/08/2019 22:43, Thomas Petazzoni wrote:
> Hello Vadim,
> 
> +Yann in Cc to gather his opinion.
> 
> On Mon, 12 Aug 2019 22:47:58 +0300
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
>> Add help output for "show-targets" command.
>>
>> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
>> ---
>>  Makefile | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 406efd1ab6..8d2070b5d0 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1132,6 +1132,7 @@ help:
>>  	@echo '  legal-info             - generate info about license compliance'
>>  	@echo '  show-info              - generate info about packages, as a JSON blurb'
>>  	@echo '  printvars              - dump internal variables selected with VARS=...'
>> +	@echo '  show-targets           - list targets of selected packages'
> 
> It does not show only packages, but also rootfs images that will be generated.
> 
> I don't know if we want to document this target, it's really an
> "internal" one. It used to be used by some scripts, but with the new
> JSON show-info, show-targets is no longer used.
> 
> We could even get rid of it in fact.

 +1 to get rid of it.

 Regards,
 Arnout
