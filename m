From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 16 Mar 2014 08:29:16 +0100
Subject: [Buildroot] Patchwork cleanup: proposal
In-Reply-To: <20140315215339.GB3396@free.fr>
References: <092927c1-b383-4e46-bc8d-c6ce491b0e98@email.android.com>
 <20140315215339.GB3396@free.fr>
Message-ID: <CAAXf6LWw--N3R-u4H-FxyYn3WF3Wr+p2190tufTUzFt9egmKPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 15, 2014 at 10:53 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-03-06 21:59 +0100, Thomas De Schampheleire spake thusly:
> [--SNIP--]
>> I would like to adjust the patchwork cleanup sessions based on this
>> experience: instead of having fixed-duration, sequential sessions of
>> two weeks, where the final triaging decision is taken at the end
>> based on input of the submitters, I would like to propose the
>> following:
>>
>> - a triaging proposal for a number of patches is sent to the list
>>   when time permits. As I'm currently leading these cleanup sessions
>>   this would be done by me, but others could help here too. There is
>>   no limit on the amount of patches that can be triaged in a given
>>   timeframe.
>>
>> - the triaging proposal is reviewed by other Buildroot developers.
>>   This agreement/disagreement phase shouldn't take long.
>>
>> - the output of this triaging can be:
>>     A. We want this patch and someone should refresh and resend it.
>>     B. We don't want this patch as it goes against Buildroot principles.
>>     C. we're not sure and want to know if the submitter is still
>>     interested in pursuing this patch.
>>
>> - In case A, ideally the original submitter refreshes the patch and
>>   resends it. If not, it ends up on the todo list.
>> - In case B, there is nothing to be done.
>> - In case C, the submitter (and other developers) get two weeks to
>>   provide feedback. When no feedback is provided, the patch is rejected.
>>
>> In a separate mail than the one with the triaging proposal, submitters
>> are notified of this decision.
>>
>>
>> The biggest advantage of this way of working would be the possibility
>> to triage more patches in each release, while still providing submitters
>> sufficient time to react.
>>
>> Let me know what you think of this...
>
> I fail to see how it differs from the previous sessions. But if you find
> it will make it easier, let's give it a spin. ;-)

The proposal differs in following ways:
- while originally we handled maximum 10 patches per two weeks, the
proposal allows to handle unlimited patches in a given timeframe.

- the patch submitters are only involved when the community has
finished the triaging. They can still contest the decision, or in case
C provide feedback, but we don't take their input as primary feedback.
For many patches, we can make an assessment without input.

>
> From my experience, I found it tedious to look at patches, unless I had
> a special interest in them
>
> May I suggest that:
>   - people that send a list of patches do so with the ones they care about
>   - we vote A/B/C as explained above

It would certainly be very useful if some contributors would do
triaging of patches they care about. It will help reduce the backlog
even faster, so yes please!

At the same time, I do think that we need a garbage collector that
looks at all remaining patches, even for those he or she does not
particularly care about. After all, this is the only way to cleanup
the list.

Best regards,
Thomas
