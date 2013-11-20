From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 20 Nov 2013 22:09:45 +0100
Subject: [Buildroot] [pkg-perl infra 05/12] qemu: add a Config.in.host
In-Reply-To: <20131120182525.02fdd612@skate>
References: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
 <1384966920-9454-6-git-send-email-francois.perrad@gadz.org>
 <20131120182525.02fdd612@skate>
Message-ID: <CAB0FRstmMWWZXLkN4Hj0XvzneBrK8tbV6pNXcoa0bNuGy-E9kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Wed, 20 Nov 2013 18:01:53 +0100, Francois Perrad wrote:
>> after the removal of cpanminus
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Config.in.host      |    1 +
>>  package/qemu/Config.in.host |   10 ++++++++++
>>  2 files changed, 11 insertions(+)
>>  create mode 100644 package/qemu/Config.in.host
>
> Adding Yann in Cc on this one. Until now, host-qemu was only used by
> cpanminus, so if cpanminus is removed, I don't see the point of keeping
> host-qemu. But I know Yann was interested in it, so it would be good to
> understand what's the plan and needs around host-qemu after cpanminus
> removal.
>

Now, host-qemu-user is required by no package.
But it remains a useful tool for a developer which could run it manually.

Fran?ois

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
