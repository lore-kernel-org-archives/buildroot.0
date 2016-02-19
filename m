From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 Feb 2016 23:14:16 +0100
Subject: [Buildroot] [PATCH] package/util-linux: fix typo in configure.ac
In-Reply-To: <20160216223231.29561c98@free-electrons.com>
References: <1455579207-5784-1-git-send-email-romain.naour@gmail.com>
 <20160216223231.29561c98@free-electrons.com>
Message-ID: <56C793B8.9020008@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 16/02/2016 22:32, Thomas Petazzoni a ?crit :

> Dear Romain Naour,
>
> On Tue, 16 Feb 2016 00:33:27 +0100, Romain Naour wrote:
>> Fixes:
>> http://autobuild.buildroot.net/results/993/9935cd0522d4f978ba2e788a690f66790686b76b
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Lada Trimasova <ltrimas@synopsys.com>
>> ---
>>   package/util-linux/0007-build-sys-fix-typo.patch | 34 ++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>   create mode 100644 package/util-linux/0007-build-sys-fix-typo.patch
> Applied to master, thanks. Please don't forget to submit the patch
> upstream (and also other util-linux patches we have and that maybe have
> not been submitted upstream yet). Thanks :-)

Well, sorry I forgot to send upstream :-/ I just sent two of these 
patches upsteam:
http://article.gmane.org/gmane.linux.utilities.util-linux-ng/12075
http://article.gmane.org/gmane.linux.utilities.util-linux-ng/12076

Patches 5 and 6 are upstream.

I'll send a patch to Buildroot to drop patch 3 since we don't support
old uClibc anymore.

Patch 1 seems still needed and not upstream yet.I need to take a closer look... Best regards, Romain

>
> Thomas
>
