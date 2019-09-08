From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Sep 2019 00:41:02 +0200
Subject: [Buildroot] [PATCH 03/27] package/gperf: bump to version 3.1
In-Reply-To: <5d756e12315a4_61ff3fdbe4181f786765a@ultri5.mail>
References: <20190908161003.25759-1-chrismcc@gmail.com>
 <5d756e12315a4_61ff3fdbe4181f786765a@ultri5.mail>
Message-ID: <20190909004102.60e7af4c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 08 Sep 2019 18:09:38 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> While testing an unrelated issue, I came across a build failure that seems
> related somehow to this bump.
> 
> When testing based on current master (one patch after this one), I get a build
> failure:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290278807
> With the same config but based on the commit just before this patch, the build
> succeeds:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290291133
> 
> Build failures are appearing on autobuilders:
> http://autobuild.buildroot.net/?reason=host-libcap-2.25
> I guess tomorrow 'Daily results' e-mail will show a plenty of them.

I can confirm I reproduced the issue locally, and reverting the gperf
bump fixes the issue. So I've reverted the gperf bump for now.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
