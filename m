From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 7 Aug 2015 15:11:51 +0300
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <20150806113014.163c6592@free-electrons.com>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com>
Message-ID: <CAMo8BfJpRhfFs39REwpq-kLUuSf+drKSRcOiRwh6bWdtMmR6bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Aug 6, 2015 at 12:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/15ba0b520043b884fc7dafbb84da171072d7d3ee/
>
> Xtensa toolchain issue:
>
>    Error: operand 2 of 'l32r' has out of range value '4294705124'
>
> Max? This is affecting only OpenCV, maybe we should simply exclude it
> from the Xtensa build?

it turned out to be rather big change, in both binutils and gcc.
I'm still testing it. I hope to send it to binutils and gcc early next week,
and if all goes well to the buildroot later next week. If not, I'll send a
patch to disable OpenCV on Xtensa.

-- 
Thanks.
-- Max
