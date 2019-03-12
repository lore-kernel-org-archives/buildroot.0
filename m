From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 01:08:33 +0100
Subject: [Buildroot] ? using compilers other than gcc!
In-Reply-To: <CAMWSM7jpZFfSLZ8pUNNODRbc_2Gm_gQtkoZNDdR+4NeoK9sXRA@mail.gmail.com>
References: <43556bee-b905-8e11-c71d-d87aa92d13f5@lamiaworks.com.au>
 <4380_1552287778_5C860822_4380_384_1_20190311070256.GA2834@r-lnx-nyma7486-2>
 <CAMWSM7jpZFfSLZ8pUNNODRbc_2Gm_gQtkoZNDdR+4NeoK9sXRA@mail.gmail.com>
Message-ID: <f084d35f-ddc3-0f05-4456-ee15c1d68dfe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/03/2019 09:01, Joseph Kogut wrote:
> On Mon, Mar 11, 2019 at 12:03 AM <yann.morin@orange.com> wrote:
>>
>> The best candidate nowadays for an alternative to gcc, is clang.
>>
> 
> In that regard, has there been any progress in supporting Clang as a
> compiler in Buildroot?

 I don't think anyone has ever proposed any patches that go into that direction.
Though I suppose that compiler-rt [1] is a necessary step.

 It's a big endeavor. There will e.g. need to be a new symbol to distinguish
between clang and gcc, and e.g. disable the kernel when clang is used.

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/project/buildroot/list/?series=84352
