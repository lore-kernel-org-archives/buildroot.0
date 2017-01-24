From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 24 Jan 2017 10:50:20 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <20170116090407.09aea4a1@free-electrons.com>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <20161217154629.09d3f0e3@free-electrons.com>
 <3e4baa3d-e4cf-0a3f-6508-f68f87012812@andin.de>
 <20161219102642.2b2b57e3@free-electrons.com>
 <d5fd9949-6575-05f0-6dbb-8d9df79869d6@andin.de>
 <20161221102024.71833cdc@free-electrons.com>
 <56c27c5a-07e1-3709-4bfc-60521b0a12c1@andin.de>
 <20170103133556.66be6aa6@free-electrons.com>
 <0da99a65-3ab0-1f86-7e51-8f95caed4c70@andin.de>
 <20170116090407.09aea4a1@free-electrons.com>
Message-ID: <7998688c-2a75-fb8f-eaa9-12d2dcf07a02@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

i agree with Thomas on setting the latest version as default. If one
needs the LTS version, probably s/he will be aware of the fact that it
has to be set explicitly.

@Andreas, as Qt 5.8 is out, are you planning to update and re-submit
your patches? If you do so, I'll be more than happy to test them and
provide feedback.

Thanks, regards

Zoltan Gyarmati
https://zgyarmati.de

On 01/15/2017 11:04 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 4 Jan 2017 18:02:02 +0100, Andreas Naumann wrote:
>
>>> However, I guess we need a version of the series that keeps the LTS
>>> version around.  
>> Ok, I'll see if I get to it. What should be the default?
> I'm not sure. I believe Buildroot generally default to the latest
> version for most components, so we should probably do the same as well
> here.
>
> Best regards,
>
> Thomas


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170124/f1dfe7d9/attachment.asc>
