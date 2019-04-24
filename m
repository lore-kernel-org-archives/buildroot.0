From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 24 Apr 2019 23:02:41 +0200
Subject: [Buildroot] [PATCH v2] configs/warp7: bump to Linux 5.0.9 and
 U-Boot 2019.01
In-Reply-To: <20190424225742.599417f5@windsurf>
References: <1556138817-8402-1-git-send-email-pjtexier@koncepto.io>
 <20190424225742.599417f5@windsurf>
Message-ID: <f3b22d37-145c-3dbf-3114-46540cef349b@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le 24/04/2019 ? 22:57, Thomas Petazzoni a ?crit?:
> On Wed, 24 Apr 2019 22:46:57 +0200
> Pierre-Jean Texier <pjtexier@koncepto.io> wrote:
>
>> This commit bumps Linux & Linux-headers to 5.0 and U-Boot to version 2019.01
>>
>> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> I think Fabio also suggested to use U-Boot 2019.04 ?
>
> Thomas


Yes indeed, but there is a known issue with 2019.04 (see [1]).

Fabio also told me to keep 2019.01 for now and bump only the Linux version.


Thanks


[1] http://patchwork.ozlabs.org/patch/1084912/

--

Signature
<https://koncepto.io> 	

*Pierre-Jean Texier*
Co-founder and Embedded Linux expert 
<https://www.linkedin.com/in/pjtexier-embeedlinux/>

pjtexier at koncepto.io <mailto:pjtexier@koncepto.io>
+33 6 27 47 58 58

*Koncepto* <https://koncepto.io> *- We develop your embedded ideas*

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190424/c4906949/attachment.html>
