From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 17 Jun 2014 10:20:58 +0200
Subject: [Buildroot] [PATCH 1/2] manual: add prerequisites for graph
	generation
In-Reply-To: <20140613171704.GE3496@free.fr>
References: <1402679208-8304-1-git-send-email-fabio.porcedda@gmail.com>
 <20140613171704.GE3496@free.fr>
Message-ID: <CAHkwnC8b7DgTmUCcJyD816Gavprkd3i2rms+_bcVdzEZTBMgWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2014 at 7:17 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2014-06-13 19:06 +0200, Fabio Porcedda spake thusly:
>> Add "graphviz" and "python-matplotlib" as prerequisites for graph
>> generation.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> Reported-by: Dallas Clement <dallas.a.clement@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> ---
>>  docs/manual/prerequisite.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
>> index c5d5442..ffe86dd 100644
>> --- a/docs/manual/prerequisite.txt
>> +++ b/docs/manual/prerequisite.txt
>> @@ -77,3 +77,7 @@ development context (further details: refer to xref:download-infra[]).
>>  ** +w3m+
>>  ** +python+ with the +argparse+ module (automatically present in 2.7+ and 3.2+)
>>  ** +dblatex+ (required for the pdf manual only)
>> +
>> +* Graph generation tools:
>> +** +graphviz+
>
> graphviz is only for the graph-depends.

Thanks, fixed.

Best regards
-- 
Fabio Porcedda
