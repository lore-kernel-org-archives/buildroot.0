From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Mon, 20 Aug 2018 14:05:15 -0700
Subject: [Buildroot] [PATCH] cryptsetup: fix build with pre C11
 toolchains
In-Reply-To: <20180820042221.j4g6qgxw3r7fczvv@sapphire.tkos.co.il>
References: <efe392e11d8deb9334a1b567a010b9dae466143b.1534335249.git.baruch@tkos.co.il>
 <bae2ff1f-ee13-489e-ba77-fedfbb023d54@mentor.com> <87k1oqopm3.fsf@tkos.co.il>
 <20180820042221.j4g6qgxw3r7fczvv@sapphire.tkos.co.il>
Message-ID: <26762ba6-c4bd-49c4-56b5-c1fe949570e8@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/19/2018 09:22 PM, Baruch Siach wrote:
> Hi Hillis,
>
> On Thu, Aug 16, 2018 at 08:19:16AM +0300, Baruch Siach wrote:
>> Hollis Blanchard writes:
>>> Worked for me.
>>>
>>> Tested-by: Hollis Blanchard <hollis_blanchard@mentor.com>
>> Thanks for the confirmation. I sent the patch upstream:
>>
>>    https://gitlab.com/cryptsetup/cryptsetup/merge_requests/49
>>
>> I'm not sure upstream would like the namespace pollution in this patch.
> As I expected, Milan Broz, cryptsetup upstream developer, didn't like the
> namespace violation that this patch introduces. But he is also unable to
> reproduce the issue on his CentOS6 system. So we might end up with no upstream
> acceptable solution. Can you help Milan in reproducing the build failure?
Yes, I posted a comment to your merge request, and will try to help 
further there.

Hollis Blanchard
Mentor Graphics Emulation Division
