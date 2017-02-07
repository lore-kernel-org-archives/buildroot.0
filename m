From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 06 Feb 2017 22:52:14 -0200
Subject: [Buildroot] [PATCH 0/9] A checkpackage script that verifies a
 package coding style
References: <8f81bbcd-b8a5-a63e-4f7f-37fb0fce66dd@gmail.com>
Message-ID: <58991a3e51c12_1b4d3ff5d2019f982964@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, Jan 21, 2017 at 03:56 PM, Romain Naour wrote:

> Le 31/12/2016 ? 04:21, Ricardo Martincoski a ?crit :

[snip]

>> Remaining patches include check functions for each type of file. I put the
>> patches that I think are most likely to be rejected in the end.
> 
> I don't really agree with that, especially for the last one (check *.mk for typo
> in variable) since it will catch easily our/my keyboard dyslexia symptoms :)

:)

> 
>> 
>> Also in the series there is a blob for the manual trying to clarify the expected
>> format for help text.
>> 
>> I did not include yet:
>> - entry to DEVELOPERS (just because it is the first iteration);
>> - explicit license entry (I guess this way the script inherits the Buildroot
>>   license).
>> 
>> For each patch I include using 'git notes':
>> - the time it takes to run for all current packages;
> 
> Well ~3 seconds to check all packages with all check enable is not bad.
> 
>> - for each check function:
>>   - the number of warnings it generates for all current packages;
>>   - sample output running on the (bad) example package.

[snip]

>> 
>> [1] http://elinux.org/Buildroot#Todo_list
> 
> The check-package script find several thousand (~2500) coding style issue or
> typos. I think the most important now is to fix all typos in variable since it
> can lead to a build failure or a licensing issue.

I will start with the easy ones :) among the typos in variables.

> 
> I'll continue to test this series and probably use it during the next Buildroot
> meeting.

Nice. Thanks.

Best regards,
Ricardo
