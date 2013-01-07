From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 7 Jan 2013 22:45:50 +0100
Subject: [Buildroot] [PATCH v2 1/6] sg3_utils: new package
In-Reply-To: <20130107222615.36bd70ab@skate>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-2-git-send-email-marek.belisko@open-nandra.com>
 <20130107222615.36bd70ab@skate>
Message-ID: <CAAfyv36e2Yk2kHFAq+p_BOpdz56Wa6qQaBW4zYJrq=4bnUf01Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 7, 2013 at 10:26 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Marek Belisko,
>
> On Mon,  7 Jan 2013 21:43:14 +0100, Marek Belisko wrote:
>
>> +config BR2_PACKAGE_SG3_UTILS
>> +     bool "sgutils"
>> +     depends on BR2_LARGEFILE
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     help
>> +       Low level utilities for devices that use a SCSI command set.
>> +
>
> You should mention here that this option only installs the library
> (libraries?), but not the programs.
OK.
>
>> +SG3_UTILS_LICENSE = BSD GPL
>
> You should be work specific than just BSD and GPL. Like BSD-3c or
> BSD-4c, GPLv2, GPLv2+, GPLv3, GPLv3+, etc.
After proper reading of COPYING file it seems it GPLv2+
"Some of the older utilities are covered by the GPL. More precisely:
You are free to distribute this software under the terms of the
GNU General Public License either version 2, or (at your option)
any later version." but in same file there is no mention about BSD
license version.
>
> Otherwise, looks good.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Thanks,

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
