From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 4 Nov 2013 09:30:40 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #2 (deadline
	November 17)
In-Reply-To: <527746D2.5000802@mind.be>
References: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
 <527746D2.5000802@mind.be>
Message-ID: <CAAXf6LV4BsU2=LAz7b87qhxASkEh8X=uS9OM+kOp5tiLGBLzZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for your feedback.

On Mon, Nov 4, 2013 at 8:03 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 01/11/13 16:09, Thomas De Schampheleire wrote:
> [snip]
>
>> linux: add default defconfig
>> Arnout Vandecappelle <arnout@mind.be>
>> http://patchwork.ozlabs.org/patch/181185
>
>
>  This one didn't receive positive feedback, so I guess it's rejected. Short
> recap: it allows you to build the kernel with the architecture's default
> defconfig, which is typically a bloaty configuration that supports many
> boards (if an appropriate device tree is present). IIRC the feedback was
> that this wasn't usually appropriate for buildroot use cases.
>
>
> [snip]
>
>> [RFC] patches-from-git.sh: new support script
>> Arnout Vandecappelle <arnout@mind.be>
>> http://patchwork.ozlabs.org/patch/182856
>
>
>  This one can definitely be rejected, since it was RFC and didn't receive
> comments AFAICR.

But you're also no longer interested in that feature right? What I
mean is: it's not that there was no feedback at the time that you
couldn't get feedback now. If you still think the script is useful,
you could resubmit the patch to revive the discussion.

Best regards,
Thomas
