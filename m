From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 19 Apr 2017 14:00:53 -0300
Subject: [Buildroot] [RFC] Adopt a coding style for Python scripts
References: <ff7902df-d244-bbdd-507e-84bf6bc6f1f5@mind.be>
Message-ID: <58f797c522aa7_548710f62c4102f@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, Apr 14, 2017 at 02:14 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 14-04-17 01:44, Ricardo Martincoski wrote:
>> D) adopt the recommendation PEP8 [1] as coding style and the tool pep8 [2] as
>>    automatic checker for coding style before submitting patches;
>>    It checks for a subset of the recommendation (e.g. file naming is not
>>    checked).
> 
>  For me, option D is great. It can also be added to the checkpackage script.

I can look into this integration.

>> What I am *NOT* proposing:
>> - use Python for every script;
>> - adapt all current Python scripts as the first step;
>> - enforce, starting now, 0 warnings from pep8 [2] before merging a patch;
>> - use an automatic formatter, like autopep8 [3];
> 
>  Nothing wrong with autopep8 - at least if it is used to generate patches, not
> as a pre-commit hook of course.

Good point. I agree.

>  The first step is to add the one line to the manual, somewhere in the
> Contributing section.

As first iteration I will send a blob to the 'Developer Guide > Coding style'
section. It's not a strong opinion, I just was unable to find a good place in
the Contributing section. In the review I can move that if you or others think
it does not fit well.

Regards,
Ricardo
