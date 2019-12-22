From: dariobin at libero.it <dariobin@libero.it>
Date: Sun, 22 Dec 2019 23:54:18 +0300
Subject: [Buildroot] 
 =?utf-8?q?=5Bgit_commit=5D_package/genimage=3A_add_p?=
 =?utf-8?q?atch_to_support_vfat_volume-label?=
In-Reply-To: <20191222211222.5ae8664e@windsurf>
References: <20191221212320.354B08D318@busybox.osuosl.org>
 <8736dc2ym1.fsf@dell.be.48ers.dk>
 <20191222211222.5ae8664e@windsurf>
Message-ID: <1577048058.757320794@f1.my.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Yes, I?ll do it.

Best regards

Dario


Inviato da Libero Mail per iOS


domenica 22 dicembre 2019, 21:12 +0100 da Thomas Petazzoni  <thomas.petazzoni@bootlin.com>:
>On Sun, 22 Dec 2019 16:01:26 +0100
>Peter Korsgaard < peter@korsgaard.com > wrote:
>
>>  > Import "0001-image-vfat-Add-label-option-to-set-volume-name.patch" from
>>  > the upstream repository. The changes made to the README.rst file had to
>>  > be removed from the patch so that the package can be compiled in
>>  > buildroot. The patch has been accepted upstream, but no releases have
>>  > been made yet which includes the feature. 
>> 
>>  > Signed-off-by: Dario Binacchi < dariobin@libero.it >
>>  > Signed-off-by: Thomas Petazzoni < thomas.petazzoni@bootlin.com > 
>> 
>> Why? What is this required for? When is the next genimage version expected?
>
>Well, it's just a new feature that someone needs. We normally don't
>take feature patches, but this one is a backport from upstream.
>genimage also does new releases fairly infrequently, so waiting for the
>next release is not necessarily nice. The patch was short enough, taken
>directly from upstream, so I said "ok, let's take, it will anyway go
>away the next time we bump".
>
>Dario, could you fill in an issue to the genimage issue tracker to ask
>for a new release? I did that last time, and it worked, within a day or
>two they published a new release.
>
>Best regards,
>
>Thomas
>-- 
>Thomas Petazzoni, CTO, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191222/00a45905/attachment.html>
