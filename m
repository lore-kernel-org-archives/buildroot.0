From: DATACOM - Erico Nunes <erico.nunes@datacom.ind.br>
Date: Wed, 28 Jan 2015 12:56:54 -0200
Subject: [Buildroot] [PATCH v2 2/2] python-jinja2: allow build as
	host-package
In-Reply-To: <54C800E3.8020907@mind.be>
References: <1422293158-26124-1-git-send-email-erico.nunes@datacom.ind.br>	<1422293158-26124-2-git-send-email-erico.nunes@datacom.ind.br>	<54C7FE07.4030206@mind.be>
 <20150127221431.14835106@free-electrons.com> <54C800E3.8020907@mind.be>
Message-ID: <54C8F8B6.5010109@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Arnout,

On 01/27/2015 07:19 PM, Arnout Vandecappelle wrote:
> On 27/01/15 22:14, Thomas Petazzoni wrote:
>> Dear Arnout Vandecappelle,
>>
>> On Tue, 27 Jan 2015 22:07:19 +0100, Arnout Vandecappelle wrote:
>>
>>>> While currently there are no in-tree Buildroot packages which depend on
>>>> host-python-jinja2, I'm currently having to deal with a proprietary
>>>> software build system that requires it.
>>>
>>>  Forgot to mention in my last review: in that case, you should also add a
>>> Config.in.host for it (and update package/Config.in.host).
>>
>> Why ? If it's merely used as a build dependency of another package, I
>> don't see why we should have a menuconfig entry for it. Indeed, having
>> a host-python-ninja2 package with no users in-tree is weird, but I
>> don't think cluttering the "Host utilities" menu with such packages is
>> the appropriate solution here.
> 
>  Hm I guess you're right. So Erico, forget I mentioned it.
> 
>  Regards,
>  Arnout
> 

I'll just add the comment in the .mk file as suggested by Arnout in the
other reply and resubmit then.

Thank you for your replies.

Erico
