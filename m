From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Feb 2019 09:29:07 +0100
Subject: [Buildroot] [PATCH v5 02/10] testing/infra: split runtime test
 from BRTest
In-Reply-To: <5c58e489a17cf_290e3faf9e0cb56013036@ultri5.mail>
References: <CANQCQpZLO+omZ5vF8Jb15RjWmcA7o9SFBatWzEmpahdvrbW7FA@mail.gmail.com>
 <5c58e489a17cf_290e3faf9e0cb56013036@ultri5.mail>
Message-ID: <60891308-e184-8656-e64a-6a7bc45a72ab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/02/2019 02:19, Ricardo Martincoski wrote:
> Hello,
> 
> On Mon, Feb 04, 2019 at 05:42 PM, Matthew Weber wrote:
> 
>> On Mon, Feb 4, 2019 at 12:19 PM Matthew Weber wrote:
>>>
>>> On Mon, Feb 4, 2019 at 9:55 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> [snip]
>>>>  This seems to be an optimisation rather than a requirement for the other
>>>> patches, so I haven't applied this - it needs to be refreshed first.
>>>>
>>>>  If you do so before Wednesday, we might still apply it.
>>>>
>>>
>>> Let me know if you won't have a chance and I'll get it updated for tomorrow.
>>>
>>
>> Ricardo, I just realized the scope of retesting this.  I went ahead
>> and fixed up the patch for v6 (this included rebase changes for
>> br2-external and new test cases needing the new class).  I also kicked
>> off a test run to check it out and I'll send the patch later if things
>> pass.
> 
> If you find the time, please do.
> It's unlikely I have enough time before Wednesday.
> 
> I started to refresh the patch, but there are some test cases failing, I don't
> know why. Probably I made some mistake.
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/46127542

 I think these failures are already happening in master:
https://gitlab.com/buildroot.org/buildroot/pipelines/45710311

 Someone really should look at the CI results :-)

 Regards,
 Arnout

> 
> I did not checked if any of these test cases already fail without this patch.
> I just kicked off a test run for this:
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/46142012
> 
> 
> Regards,
> Ricardo
> 
