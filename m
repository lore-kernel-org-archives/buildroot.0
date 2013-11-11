From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 11 Nov 2013 09:49:01 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <87wqkf6zjq.fsf@dell.be.48ers.dk>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>	<20131109191543.414f5694@skate>
 <5280A0D3.1080605@imgtec.com> <87wqkf6zjq.fsf@dell.be.48ers.dk>
Message-ID: <5280A80D.2000806@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/2013 09:46 AM, Peter Korsgaard wrote:
>>>>>> "Markos" == Markos Chandras <Markos.Chandras@imgtec.com> writes:
>
> Hi,
>
>>>> mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/cb87635832f4a1128f174a25c264f716399c52d4/
>>>
>>> MIPS specific problem. We're building for mips1, but fdk-aac uses some
>>> instructions not available on mips1. Maybe we should only enable
>>> fdk-aac for some more capable variant of MIPS instruction sets.
>
>> This needs for 'your-peter' branch to be merged first which contains
>> the change from -mtune->-march for MIPS. I checked and that branch was
>> still not merged so this will have to wait.
>
> But it is?
>
> http://git.buildroot.net/buildroot/commit/?id=f60dafe06833a17540608d1c8172
>

Yes sorry I didn't notice :)

-- 
markos
