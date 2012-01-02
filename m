From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 2 Jan 2012 14:15:25 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2012.02/host-tools
In-Reply-To: <4EFE30B2.1030105@lucaceresoli.net>
References: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
 <4EFE30B2.1030105@lucaceresoli.net>
Message-ID: <CAAXf6LUNApUkwGD9T+iABuC7AouDhC1hVWX1y+xFwsX1katJ3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 30, 2011 at 10:44 PM, Luca Ceresoli <luca@lucaceresoli.net>wrote:

> Thomas Petazzoni wrote:
>
>> Hello,
>>
>> This is the second posting of this patch set that allows some host
>> utilities to be visible in menuconfig, when those host utilities are
>> not simply build dependencies, but might also be directly interesting
>> for the user (image creation utilities, device programming utilities,
>> etc.).
>>
>> A first posting was done on October, 1st 2011, and the general idea
>> and implementation received positive comments from Luca Ceresoli and
>> Thomas De Schampheleire.
>>
>> Changes since v1:
>>
>>  * Fix a commit log, as per the comment from Luca Ceresoli
>>
>>  * Add the SAM-BA utility from Atmel as another host utility. This
>>    tool can be used from the development machine to reflash a virgin
>>    AT91-based device, through USB or serial.
>>
>> Regards,
>>
>> Thomas
>>
>
> For the entire series:
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
>

Aside from the alphabetical ordering in package/Config.in.host:
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120102/1e357cc1/attachment.html>
