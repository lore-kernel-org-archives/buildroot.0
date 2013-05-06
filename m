From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 6 May 2013 15:35:59 +0800
Subject: [Buildroot] [PATCH v7 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <20130503204819.40b01da9@skate>
References: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
 <1367577580-3518-6-git-send-email-sonic.adi@gmail.com>
 <20130503204819.40b01da9@skate>
Message-ID: <CAJxxZ0OGox-00E09a1S_Sj7-BhGHjzaTzDDff0t3Aw0s705rOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, May 4, 2013 at 2:48 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Fri, 3 May 2013 18:39:39 +0800, Sonic Zhang wrote:
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Reserve all 3 blackfin toolchain folders under the TOOLCHAIN_EXTERNAL_DIR.
>> Set current blackfin toolchain bin folder to the toolchain prefix subfolder.
>> Install FDPIC and FLAT library in target ext-toolchain-installed.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>
> Something strange is going in this patch, I can't apply it. git
> complains that it lacks some repository informations.
>
> Is your branch containing those 7 patches really based on Buildroot
> master?
>
They are against 2013.02 release tag.
I will send out v8 against the master head.
