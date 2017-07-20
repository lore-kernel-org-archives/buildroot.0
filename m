From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:27:07 +0200
Subject: [Buildroot] [PATCH 1/1] python: fix the _ctype module compiling
 error caused by ffi library
In-Reply-To: <CAO6UsjBMM4PUTuY5HK+AJAS2FQTTGOgQHHrSpUmZVSJ5ibQsZA@mail.gmail.com>
References: <CAO6UsjBMM4PUTuY5HK+AJAS2FQTTGOgQHHrSpUmZVSJ5ibQsZA@mail.gmail.com>
Message-ID: <20170720222707.2604ddf7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Your patch is line-wrapped. Could you please send it with "git
send-email" ?

On Thu, 20 Jul 2017 22:49:08 +0800, Diankun Zhang wrote:
> The ctype compiling error for python 2 is caused by the mixed
> ifdefs X86_WIN32 and X86_WIN64. The issue is tracked by
> python upstream issue  https://bugs.python.org/issue23042.
> Whereas the patch is not completely applied on python package.
> This additional patch is a supplement for the issue.
> 
> Signed-off-by: Diankun Zhang <kundy.zhang@gmail.com>

Which Buildroot configuration causes the build error fixed by this
patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
