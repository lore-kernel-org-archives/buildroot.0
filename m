From: ir. Tjeerd Pinkert <t.j.pinkert@vu.nl>
Date: Wed, 25 Mar 2015 11:55:07 +0100
Subject: [Buildroot] [Bug-readline] IPython/readline segfaults
In-Reply-To: <20150325003203.GL10761@vapier>
References: <55116D12.1000106@vu.nl> <5511B114.60704@case.edu>
 <20150325003203.GL10761@vapier>
Message-ID: <5512940B.60808@vu.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks, indeed, buildroot 2015.02 has 6.3 with no patches, although it 
downloads the latest tar file. I'm trying to see if patching helps.

On 25-03-15 01:32, Mike Frysinger wrote:
> On 24 Mar 2015 14:46, Chet Ramey wrote:
>> On 3/24/15 9:56 AM, ir. Tjeerd Pinkert wrote:
>>> I stumbled upon a readline problem on powerpc, maybe an uninitialised
>>> variable or something like that. Please see:
>>>
>>> https://github.com/ipython/ipython/issues/8087#issuecomment-83660592
>>
>> A stack traceback from the core dump, and information about the version
>> of readline you're using, would be helpful.
>
> my guess is he's missing the recent patches.  ipython was crashing in Gentoo
> until we applied readline63-002.
> -mike
>
