From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Sep 2015 14:21:40 +0100
Subject: [Buildroot] [PATCH] docs/manual: add the "mark as superseded"
 hint
In-Reply-To: <20150907151606.6e6357f4@free-electrons.com>
References: <1441627745-1553-1-git-send-email-Vincent.Riera@imgtec.com>	<55ED7FFE.9040102@mind.be>
 <20150907151606.6e6357f4@free-electrons.com>
Message-ID: <55ED8F64.5080706@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/07/2015 02:16 PM, Thomas Petazzoni wrote:
> Arnout, Vicente,
> 
> On Mon, 7 Sep 2015 14:15:58 +0200, Arnout Vandecappelle wrote:
> 
>>> +When you provide a new version of a patch, please mark the old one as
>>> +superseded in http://patchwork.buildroot.org[patchwork].
>>
>>  It may be useful to add that it's necessary to create an account to be able to
>> do that:
>>
>> You need to create an account on patchwork to be able to modify the status of
>> your patches. Note that you can only change the status of patches you submitted
>> yourself.
> 
> And:
> 
>  * More generally explain what is patchwork, and what it is doing

That's already included in the manual. See:

"Patchwork

    Patchwork is a web-based patch tracking system designed to
facilitate the contribution and management of contributions to an
open-source project. Patches that have been sent to a mailing list are
'caught' by the system, and appear on a web page. Any comments posted
that reference the patch are appended to the patch page too. For more
information on Patchwork see http://jk.ozlabs.org/projects/patchwork/."

>  * That the account must be created with an e-mail address matching the
>    one used to submit the patches

Already included in v2:

http://patchwork.ozlabs.org/patch/515116/

Regards,

Vincent.

> 
> Thomas
> 
