From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 15 May 2014 14:51:58 +0400
Subject: [Buildroot] [PATCH] gdb: add xtensa fixes for 7.5.1
In-Reply-To: <20140515091523.272c9e2f@free-electrons.com>
References: <1400113561-851-1-git-send-email-jcmvbkbc@gmail.com>
 <20140515091523.272c9e2f@free-electrons.com>
Message-ID: <CAMo8BfKU3+7nFEMmROm4GKYhiHF_EL5vbRTrx=9SGGcTQwHOnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 15, 2014 at 11:15 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Max Filippov,
>
> On Thu, 15 May 2014 04:26:01 +0400, Max Filippov wrote:
>> Two fixes for xtensa are still applicable to gdb-7.5.1, which is now the
>> default; copy them from 7.4.1 and rename accordingly.
>> This fixes native and cross-gdb build for xtensa.
>>
>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>> ---
>>  .../gdb/7.5.1/gdb-100-xtensa-asm-ptrace-h.patch    | 22 ++++++++++++++++++++++
>>  package/gdb/7.5.1/gdb-101-xtensa-regsize.patch     | 19 +++++++++++++++++++
>>  2 files changed, 41 insertions(+)
>>  create mode 100644 package/gdb/7.5.1/gdb-100-xtensa-asm-ptrace-h.patch
>>  create mode 100644 package/gdb/7.5.1/gdb-101-xtensa-regsize.patch
>
> Thanks. It would have been nice to have description + Signed-off-by for
> these patches. I know they already exist in the tree for 7.4.1, but
> it's not an excuse to continue to do things badly :-)

Sure, I can backport these patches from the binutils-gdb, they have all that.

-- 
Thanks.
-- Max
