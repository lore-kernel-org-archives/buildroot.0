From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 5 Feb 2014 20:48:01 +0100
Subject: [Buildroot] [pkg-perl infra V4 9/9] qemu: add a Config.in.host
In-Reply-To: <20140205170456.2440f114@skate>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-10-git-send-email-francois.perrad@gadz.org>
 <20140205170456.2440f114@skate>
Message-ID: <CAB0FRsswiwUhbho2EU-kTh1ASYYvq+_wHFtojKvfwUL92c85+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-05 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Wed,  5 Feb 2014 14:53:00 +0100, Francois Perrad wrote:
>> after the removal of cpanminus
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Config.in.host      |    1 +
>>  package/qemu/Config.in.host |   10 ++++++++++
>>  2 files changed, 11 insertions(+)
>>  create mode 100644 package/qemu/Config.in.host
>
> I'm not sure this should be part of the Perl patch series. At the
> meeting, I think we all agreed that building the Qemu user-mode
> emulation for the host is not useful as it cannot work properly.
> Instead the qemu package should build the system-mode emulation for the
> host, which is something that Gustavo proposed some time ago.
>
> So I'd say to leave Qemu on the side for now, and focus on the Perl
> side of things in this patch series.
>

Frank Hunleth needs it.
See http://lists.busybox.net/pipermail/buildroot/2013-December/084131.html
& http://patchwork.ozlabs.org/patch/299014/

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
