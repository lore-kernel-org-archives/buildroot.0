From: lpdev at cordier.org <lpdev@cordier.org>
Date: Mon,  4 Feb 2019 10:11:19 +0100 (CET)
Subject: [Buildroot] [PATCH v2 6/6] Update DEVELOPERS.
In-Reply-To: <20190202154722.13d68a6f@windsurf>
Message-ID: <ea-mime-5c5801b7-378a-4f955ad5@www-5.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

First of all, thank you for taking the time to review this serie of patches.

>De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>? : Louis-Paul Cordier <lpdev@cordier.org>
>Sujet : Re: [Buildroot] [PATCH v2 6/6] Update DEVELOPERS.
>Date : 02/02/2019 15:47:22 Europe/Paris
>Copie ? : buildroot at buildroot.org;
>   Bernd Kuhls <bernd.kuhls@t-online.de>;
>   MahyarKoshkouei <mahyar.koshkouei@gmail.com>
>
>Hello Louis-Paul,
>
>Thanks for working on this topic. A few minor/silly comments below.
>
>On Thu, 31 Jan 2019 13:15:26 +0100
>Louis-Paul Cordier <lpdev@cordier.org> wrote:
>
>> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
>> ---
>> DEVELOPERS | 5 +++++
>> 1 file changed, 5 insertions(+)
>> 
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index c1950bb0f4..dfe7bd67c0 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1262,6 +1262,11 @@ F: package/ti-sgx-demos/
>> F: package/ti-sgx-km/
>> F: package/ti-sgx-um/
>> 
>> +N: Louis-Paul Cordier <lpdev@cordier.org>
>> +F: package/intel-gmmlib
>> +F: package/intel-mediadriver
>> +F: package/intel-mediasdk
>
>Indentation is not correct, please follow the indentation style used in
>the rest of the file.

My text editor trapped me on this.

>
>Also, the update to the DEVELOPERS file should be done within the
>patches adding the packages. So the patch adding intel-gmmlib should
>update the DEVELOPERS file for intel-gmmlib, and so on for
>intel-mediadriver and intel-mediasdk.
>
>Final nit: don't put a final dot in commit titles.

Copy that, thanks!

>
>Thanks!
>
>Thomas
>-- 
>Thomas Petazzoni, CTO, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com
