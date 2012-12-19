From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Dec 2012 23:36:03 +0100
Subject: [Buildroot] [PATCH] sg3-utils new package.
In-Reply-To: <CAAfyv35TW9i7-R1KJEnJSkOyV2dvkhabtFPnLip-fifEdop+QQ@mail.gmail.com>
References: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
 <20121218094835.688afe2c@skate>
 <CAAfyv37=U0YtKsNkoCxTA2iRAXwgTETrcuOPWXmvNasnOqZaSA@mail.gmail.com>
 <20121218100332.7a0c10d0@skate>
 <CAAfyv35TW9i7-R1KJEnJSkOyV2dvkhabtFPnLip-fifEdop+QQ@mail.gmail.com>
Message-ID: <20121219233603.613c2ca5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Belisko Marek,

On Wed, 19 Dec 2012 23:11:31 +0100, Belisko Marek wrote:

> configure.ac:13: the top level
> configure.ac:225: warning: AM_NLS is m4_require'd but not m4_defun'd
> aclocal.m4:1204: IT_PROG_INTLTOOL is expanded from...
> configure.ac:225: the top level
> configure:14234: error: possibly undefined macro: AM_NLS
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> 
> Am I missing some dependency?

I guess this macro is installed by gettext, but not sure.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
