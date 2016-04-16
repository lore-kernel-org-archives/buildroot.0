From: Steve Calfee <stevecalfee@gmail.com>
Date: Fri, 15 Apr 2016 18:06:45 -0700
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <CAJJ6jxuJg9wO-cGRWM45GqJN-MHtq0EFDGZ5VReDO5OQi_JcUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 15, 2016 at 8:40 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> From: Elizabeth Liner <eliner@us.ibm.com>
>
> This change will add in the custom _defconfig's to the buildroot
> makefile so that when a _defconfig is in the custom directory it is
> recognized correctly, and is able to be used.
>
> Signed-off-by: Elizabeth Liner <eliner@us.ibm.com>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Hi,

What is the usecase? Isn't a defconfig in br2_external/configs already custom?

It seems the affect of this patch is just to add another subdirectory
in $BR2_EXTERNAL named custom?

I think the philosophy is to keep buildroot as simple as possible, but
no more than that.

Regards, Steve
