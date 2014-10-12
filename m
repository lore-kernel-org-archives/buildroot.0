From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Sun, 12 Oct 2014 20:41:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: bump to version 0.8.3
In-Reply-To: <20141012183703.3108bb5b@free-electrons.com>
References: <1413110453-20327-1-git-send-email-jkrause@posteo.de>
 <20141012183703.3108bb5b@free-electrons.com>
Message-ID: <543ACB49.4090904@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 10/12/2014 06:37 PM, Thomas Petazzoni wrote:
> Dear J?rg Krause,
>
> On Sun, 12 Oct 2014 12:40:53 +0200, J?rg Krause wrote:
>> Since version 0.8.2 upmpdcli builds with gcc >= 4.5. This allows compilation
>> with the CodeSourcery toolchain versions 2011.03 and 2010.09 for the PowerPC
>> architecture.
>>
>> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> This version fails to build on x86-64:
> http://autobuild.buildroot.org/results/7a6/7a67306839642468497b2fed963c27c077fc691d/build-end.log.
> Don't know if it's a new problem or not.

The new version depends on libcurl now. Somehow I missed this. I will 
fix this...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141012/8ca85a97/attachment.html>
