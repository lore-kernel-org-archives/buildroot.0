From: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Thu, 1 Jul 2021 00:28:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/mupdf: new package.
In-Reply-To: <d5c3870f-a7a3-da10-6fdd-eb588df78d18@mind.be>
References: <20200207093705.32687-1-raphael.melotte@essensium.com>
 <20200207093705.32687-2-raphael.melotte@essensium.com>
 <d5c3870f-a7a3-da10-6fdd-eb588df78d18@mind.be>
Message-ID: <ae75dda3-caac-3194-4117-8069df7c800a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 5/26/21 10:05 PM, Arnout Vandecappelle wrote:
>   Applied to next with some changes.

Thanks a lot for the fixups and the merge!

> 
>   Did you send this patch upstream?
> 

Not originally, but now I did ([1]), thanks for the reminder.

>   You'll get weekly mails to remind you to update to 1.18.0 :-)
> 

For some reason I don't, even though release-monitoring knows about 1.18.0...

> 
>   There's also a significantly smaller .xz. We prefer that.
> 

Okay, I'll take it into account for 1.18.0.

> 
>   I guess it would be OK to use GLUT if freeglut is selected, so maybe this
> should be put inside ifneq ($(BR2_PACKAGE_FREEGLUT),y) ?
> 

Okay, I'll do that.


Thanks,

Rapha?l

[1]: https://github.com/ArtifexSoftware/mupdf/pull/25
