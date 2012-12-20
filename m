From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 20 Dec 2012 11:58:40 +0100
Subject: [Buildroot] [PATCH] sg3-utils new package.
In-Reply-To: <20121219233603.613c2ca5@skate>
References: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
 <20121218094835.688afe2c@skate>
 <CAAfyv37=U0YtKsNkoCxTA2iRAXwgTETrcuOPWXmvNasnOqZaSA@mail.gmail.com>
 <20121218100332.7a0c10d0@skate>
 <CAAfyv35TW9i7-R1KJEnJSkOyV2dvkhabtFPnLip-fifEdop+QQ@mail.gmail.com>
 <20121219233603.613c2ca5@skate>
Message-ID: <CAAfyv36Bvse6Mwqcc8tDVTunAG0wMxUddt6Ymti7rHbusHVDzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Dec 19, 2012 at 11:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Belisko Marek,
>
> On Wed, 19 Dec 2012 23:11:31 +0100, Belisko Marek wrote:
>
>> configure.ac:13: the top level
>> configure.ac:225: warning: AM_NLS is m4_require'd but not m4_defun'd
>> aclocal.m4:1204: IT_PROG_INTLTOOL is expanded from...
>> configure.ac:225: the top level
>> configure:14234: error: possibly undefined macro: AM_NLS
>>       If this token and others are legitimate, please use m4_pattern_allow.
>>       See the Autoconf documentation.
>>
>> Am I missing some dependency?
>
> I guess this macro is installed by gettext, but not sure.
Hmm it was my mistake somehow. I proceed forward but now have troubles
in configuration phase:
checking for LIBPARTED... yes
checking for DEVMAPPER... no
configure: error: Package requirements (devmapper >= 1.02) were not met:

I choose BR2_PACKAGE_LVM2 and aso add dependency to lvm2 but error still exists.
I was looking to stagin directory and libdevmapper is is /usr/lib. Not
sure why it pkg-config cannot
find. Ideas?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Thanks in advance,

Marek

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
