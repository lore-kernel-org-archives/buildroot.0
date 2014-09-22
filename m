From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 22 Sep 2014 13:42:18 +0200
Subject: [Buildroot] [PATCH] perl: fix build of native modules
In-Reply-To: <20140921212914.0217edab@free-electrons.com>
References: <1410979865-26207-1-git-send-email-francois.perrad@gadz.org>
 <20140921212914.0217edab@free-electrons.com>
Message-ID: <CAB0FRst09x641A6wOFCfAsXnjQ-XgeqAH2YzHpWnYVVOuk5HpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-09-21 21:29 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Wed, 17 Sep 2014 20:51:05 +0200, Francois Perrad wrote:
>> CORE/vutil.h is required when the host perl version is 5.20
>> see http://autobuild.buildroot.net/results/c3d/c3d48c3b3d6c1e616d8e20a2f65d8ba33abe61da/
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/perl/perl.mk | 1 +
>>  1 file changed, 1 insertion(+)
>
> Applied, thanks.
>

Dear Thomas,

could you apply this patch http://patchwork.ozlabs.org/patch/380463/ too.

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
