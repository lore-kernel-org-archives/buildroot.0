From: =?UTF-8?Q?Rafa=C5=82_Fabich?= <rafal.fabich@gmail.com>
Date: Wed, 13 Feb 2013 17:54:08 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as soure of
	kernel code
In-Reply-To: <511A78BA.4010200@mind.be>
References: <1360310725-6463-1-git-send-email-rafal.fabich@gmail.com>
 <1360310725-6463-2-git-send-email-rafal.fabich@gmail.com>
 <511A78BA.4010200@mind.be>
Message-ID: <CAPRxd43q0nW6CBtzAx3QCo9Loyyvz7_78D3ZFYWH797_Z8yr+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Tue, Feb 12, 2013 at 6:15 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  One comment below, though.
>
>> +       default "local" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
>
>
>  This is a bit confusing, because the 'local' site method will force
> LINUX_VERSION to "custom". So I would call it custom here as well.
>

I would like to send a new version of this patch, should I create a
new thread or use this one?

Best regards,
Rafal Fabich
