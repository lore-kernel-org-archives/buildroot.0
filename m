From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 14 Mar 2018 20:16:17 -0300
Subject: [Buildroot] [PATCH v3 6/7] .gitlab-ci.yml: check flake8
References: <20180313181519.GC4317@scaer>
Message-ID: <5aa9ad41d2fec_41fe2ab6b2513450655d5@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Mar 13, 2018 at 03:15 PM, Yann E. MORIN wrote:

> On 2018-03-13 00:09 -0300, Ricardo Martincoski spake thusly:
>> ---
>> BEFORE APPLYING, see this note from Yann:
>> Note: this can only be applied _after_ we regenerate the docker image.
>> Then we'll have to update the version of the image at the top of the
>> gitlab-ci.yml file.
> 
> Indeed, so I've marked this patch as "deferred" in patchwork, so it does
> not get accidentally applied.

Could you regenerate the image, please?
I don't have the docker push permission.

Regards,
Ricardo
