From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 25 Feb 2014 21:28:43 +0100
Subject: [Buildroot] [PATCH v2 1/2] udev: update udev to new virtual
 package infra.
In-Reply-To: <530CCBFC.6070603@mind.be>
References: <1393233942-11638-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393233942-11638-2-git-send-email-eric.le.bihan.dev@free.fr>
 <530CCBFC.6070603@mind.be>
Message-ID: <CAHXCMMJUAbsfj=WibLcQ=n+W-do1okDEyACmdcfteD+u-ojVhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 25, 2014 at 5:59 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 24/02/14 10:25, Eric Le Bihan wrote:
>> The udev virtual package and its current providers (eudev and systemd)
>> have been updated to use the latest version of virtual package
>> infrastructure.
>>
>> A provider should now select BR2_PACKAGE_HAS_UDEV and well as set a
>> value for BR2_PACKAGE_PROVIDES_UDEV.
>>
>> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
