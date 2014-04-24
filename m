From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Thu, 24 Apr 2014 10:57:18 +0200
Subject: [Buildroot] [Question] Are there tutorials for differnt rootfs ?
In-Reply-To: <5357DDB2.7080507@mind.be>
References: <53578C56020000460004DEA4@gwia2.rz.hs-offenburg.de>
 <5357DDB2.7080507@mind.be>
Message-ID: <5358EE0E020000460004DFCA@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>> Arnout Vandecappelle <arnout@mind.be> 23.04.14 17.36 Uhr >>>
>On 23/04/14 09:48, Frank Ihle wrote:
>> Hi Buildroot,
>>  
>> I was trying to switch from initramfs to different rootfs options of
>> Buildroot 2013.11. Unfortunately it seems that only  Images with an
>> initramfs and an already decompressed rootfs on a separate partition seem
>> to work to boot my system.
>>  
>> Because I guess to fix this error is a far bigger thread, I just want to
>> know if there are some examples or tutorials of how to use different
>> rootfs. Including e.g.: what the kernel command line has to look like,
>> the drivers that are used etc. - basically everything that is needed to
>> run my embedded system with a specific filesystem.
>
 >I believe there are a few examples in the documentation, but the number
>of possibilities is simply too large to document. There are also a few
>examples in READMEs of the supported boards. It depends quite a lot on
>your target architecture and your boot medium.

Hello Arnout,

thanks for the response. Well that's what I guessed, that there are various ways to get this running. Still I thought there is some kind of best practice.

Kind Regards

Frank


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140424/611b167f/attachment.html>
