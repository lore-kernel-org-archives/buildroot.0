From: Evgueni Tarassov <eugene@largest.net>
Date: Thu, 12 Apr 2018 18:50:33 -0700
Subject: [Buildroot] [PATCH 1/1] tcf-agent: bump to version 1.7.0
In-Reply-To: <20180412234935.3ae48694@windsurf>
References: <20180412151310.15252-1-eugene@largest.net>
 <20180412234935.3ae48694@windsurf>
Message-ID: <ece5ee53-47f3-f446-f0b8-ce3b6cfc2975@largest.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I was not aware Norbert had already sent a patch.

His patch appears to make other changes in addition to selecting newer 
version, like switching to make from cmake, some changes from after 
1.7.0, and support for static linking.
My goal was less ambitious: just version up to 1.7.0 - for now, and 
delete old patches - they are not needed anymore because of upstream fixes.
I'm new to Buildroot. So far, I don't even understand the need to switch 
to make or to support static linking of tcf-agent.
Anyway, I, personally, would prefer to handle tcf-agent issues upstream, 
through eclipse.org, without having patches in the Buildroot package.

Regards,
Eugene

On 4/12/2018 2:49 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 12 Apr 2018 08:13:10 -0700, Eugene Tarassov wrote:
>> Build issues with MicroBlaze and PPC64 targets are fixed
>>
>> Signed-off-by: Eugene Tarassov <eugene@largest.net>
> Thanks Eugene for this patch. However, Norbert had already sent a patch
> to bump to 1.7.0, and his patch raised a number of questions that
> haven't been answered:
>
>    http://patchwork.ozlabs.org/patch/880414/
>
> In particular, Norbert submission was adding two patches to fix build
> issues, and doing a lot more changes in tcf-agent.mk. I'm wondering why
> your patch is so different, and doesn't include Norbert changes.
>
> Thanks,
>
> Thomas
