From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Mon, 21 Sep 2015 09:48:07 -0300
Subject: [Buildroot] [PATCH 1/2] cmake: bump to version 3.3.2
In-Reply-To: <20150920133408.70a1c6a4@free-electrons.com>
References: <1442666531-17795-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20150920133408.70a1c6a4@free-electrons.com>
Message-ID: <55FFFC87.1010900@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 20/09/15 08:34, Thomas Petazzoni wrote:

> Gustavo,
>
> On Sat, 19 Sep 2015 09:42:11 -0300, gustavo.zacarias at free-electrons.com
> wrote:
>> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>>
>> xtensa patch is upstream so there's no need for it any longer.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>
> This is causing some build issues:
>
>    http://autobuild.buildroot.net/results/2bd81e2ecb09e64ccf9e5c35f1160a9b9e7bd079/
>
> Can you have a look?

Hi Thomas.
It's just that single failure in that single host, for a file that never 
changes.
I bet it's a SEU, the ASCII code for 'L' is 0100 1100, and for '\' it's 
0101 1100.
According to https://gcc.gnu.org/wiki/CompileFarm gcc75 is an i7-2600, 
hence no ECC memory.
Regards.
