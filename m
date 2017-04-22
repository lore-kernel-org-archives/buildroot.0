From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 12:47:54 -0400
Subject: [Buildroot] [PATCH 1/7] package configs: clean up indentation
	warnings.
In-Reply-To: <20170422155352.7c6cca5a@free-electrons.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
 <20170422155352.7c6cca5a@free-electrons.com>
Message-ID: <CAFSsvmrVYi1gn-U1Zk=+F2+aazno9_FSdci_KZ39P87K3OXN5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Sat, Apr 22, 2017 at 9:53 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 21 Apr 2017 11:24:46 -0400, Adam Duskett wrote:
>> The check-package script when ran gave warnings on indentation issues
>> on all of these Config files.  This patch cleans up all warnings
>> related to the indentation of the Config files in the package directory.
>>
>> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
>> ---
>>  package/b43-firmware/Config.in       |   8 +-
>>  package/binutils/Config.in.host      |  12 +-
>>  package/gcc/Config.in.host           | 156 +++++------
>>  package/gdb/Config.in.host           |  12 +-
>>  package/jquery-ui-themes/Config.in   |  96 +++----
>>  package/kodi/Config.in               | 100 +++----
>>  package/linux-headers/Config.in.host |  85 +++---
>>  package/lua/Config.in                |  12 +-
>>  package/uclibc/Config.in             |  28 +-
>>  package/x11r7/Config.in              | 526 ++++++++++++++++++-----------------
>>  10 files changed, 522 insertions(+), 513 deletions(-)
>
> This looks good overall, except for package/Config.in. The indentation
> is done on purpose in this file, I believe so that "diff" puts some
> useful text in the context, making the patches touching
> package/Config.in easier to read.
>
> So please drop the change to package/Config.in.
>
Not sure what you mean? I don't see package/Config.in in this patch?

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
Adam
