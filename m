From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Wed, 16 Sep 2020 04:22:36 +0000
Subject: [Buildroot] [PATCH] package/glibc: ARC: use upstream 2.32
In-Reply-To: <20200915153324.318c612b@windsurf.hq.k.grp>
References: <20200914213748.3953423-1-vgupta@synopsys.com>
 <20200915153324.318c612b@windsurf.hq.k.grp>
Message-ID: <94daa7f5-5780-9716-cea8-a355930e33c6@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/15/20 6:33 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 14 Sep 2020 14:37:48 -0700
> Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
>> ARC glibc port was merged upstream in 2.32
>> There's no need to refer to github as it has the exact same version and
>> can be retired in future.
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>> ---
>>  .../glibc.hash                                |  2 ++
>>  package/glibc/glibc.mk                        | 20 ++++++++++---------
>>  2 files changed, 13 insertions(+), 9 deletions(-)
>>  create mode 100644 package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
> The hash file for the ARC-specific glibc version used on Github should
> be dropped.

The hash in the patch is from the sourceware downloaded gz.

$ sha256sum ../dl/glibc/glibc-2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5.tar.gz

07f3804abbc6a23315f09568686c0e5bb81d714251cf537d25a36f826cae540b?
../dl/glibc/glibc-2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5.tar.gz
