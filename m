From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Oct 2013 10:19:01 +0100
Subject: [Buildroot] [PATCH] arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
In-Reply-To: <20131030184534.7bf2477b@skate>
References: <1382970069-16449-1-git-send-email-markos.chandras@imgtec.com>
 <20131030184534.7bf2477b@skate>
Message-ID: <CAAXf6LVCOqiCdQfy+S_YRiA2c1fzGpip36=hM4c6M+cV=S47og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 30, 2013 at 6:45 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Mon, 28 Oct 2013 14:21:09 +0000, Markos Chandras wrote:
>> Set --with-arch instead of --with-tune for MIPS so that the
>> generated code will be optimal for the given MIPS ISA.
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>
> Applied to for-peter-2013.11, a branch that I will ask Peter to pull
> when he comes back. I will mark such patches as Accepted in patchwork,
> making the (maybe optimistic) assumption that Peter will pull my entire
> branch.

Why not use the 'Delegated to' field in patchwork instead? It will
keep the patch as New, until being applied, and it is clear whose
branch it is in.
