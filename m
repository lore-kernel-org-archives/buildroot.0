From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 13 Aug 2012 18:21:01 +0800
Subject: [Buildroot] [PATCH 4/5] Linux: Unpatch customer kernel source
 tree before make clean.
In-Reply-To: <20120811201109.059aa4f0@skate>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-4-git-send-email-sonic.adi@gmail.com>
 <20120811201109.059aa4f0@skate>
Message-ID: <CAJxxZ0NFzZ2jyKgdBT8-LruJicdti-CxxWmz3h71d_L4hNXe2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 12, 2012 at 2:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Tue, 7 Aug 2012 17:09:36 +0800,
> Sonic Zhang <sonic.adi@gmail.com> a ?crit :
>
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Unpatch only patches which match current kernel version.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>
> What is the use case for this?
>
> Again, you're implementing something completely specific for the linux
> package while the logic itself has nothing specific to the Linux
> kernel. So if we ever want something like this, we want to implement it
> at the package infrastructure level, and clearly not in some random
> specific package.
>

I will try to turn these unpatch script into a make clean hook for
packages with override source.


Regards,

Sonic
