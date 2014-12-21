From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 21 Dec 2014 21:20:56 +0100
Subject: [Buildroot] [PATCH 1/1] add new package tinc
In-Reply-To: <20141221164128.43d07933@free-electrons.com>
References: <1418741278-32077-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20141221164128.43d07933@free-electrons.com>
Message-ID: <54972BA8.6050800@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 12/21/2014 04:41 PM, Thomas Petazzoni wrote:
> Dear Zoltan Gyarmati,
> 
> On Tue, 16 Dec 2014 15:47:58 +0100, Zoltan Gyarmati wrote:
>> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> ---
>>  package/Config.in      |  1 +
>>  package/tinc/Config.in | 11 +++++++++++
>>  package/tinc/tinc.mk   | 13 +++++++++++++
>>  3 files changed, 25 insertions(+)
>>  create mode 100644 package/tinc/Config.in
>>  create mode 100644 package/tinc/tinc.mk
> 
> Patch applied, thanks. I've only done some minor changes:
> 
>     [Thomas:
>      - fix license from GPLv2 to 'GPLv2+ with OpenSSL exception'
>      - add -std=c99 to CFLAGS, otherwise it doesn't build with a minimal
>        toolchain configuration
>      - add BR2_USE_MMU dependency since fork() is used.]
> 
> Thanks for your contribution!
> 

Thanks for the fixes!


> Thomas
> 

-- 
Bests,
Zoltan Gyarmati
IRC freenode: zgyarmati

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141221/f4a8895d/attachment.asc>
