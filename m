From: michael.miller at prga.com <michael.miller@prga.com>
Date: Fri, 29 Jun 2007 08:22:08 -0500
Subject: [Buildroot] syslinux.mk & bzip2 errors, modification
In-Reply-To: <20070629074645.GB8033@aon.at>
References: <1497cb6d0706282337g19372f54t3275752462df147e@mail.gmail.com>
	<20070629074645.GB8033@aon.at>
Message-ID: <6B9D9C36F5A26347A593D6945C470AE90F4090@delta-two.prga.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>-----Original Message-----
From: buildroot-bounces@uclibc.org
[mailto:buildroot-bounces at uclibc.org] On Behalf Of Bernhard Fischer
>Sent: Friday, June 29, 2007 2:47 AM
>To: Lee JJ
>Cc: buildroot at uclibc.org
>Subject: Re: [Buildroot] syslinux.mk & bzip2 errors, modification
>>2.
>>cp /root/buildroot/build_i686/bzip2-1.0.3/bzlib.h
>>/root/buildroot/build_i686/staging_dir/include/
>>cp: cannot create regular file
>>`/root/buildroot/build_i686/staging_dir/include/bzlib.h': No such file

>>or directory
>>
>>buildroot/build_i686/staging_dir/"include/" <--- do not know where is 
>>the script error have to create the "include" directory by hand
>
>This is most likely coming from old sources or an old build.
>svn up
>rm -rf build_* toolchain_* && make
>and it should be fixed.

I built and installed Subversion to test this.  I tried this with SVN
18952 and the include directory problem was indeed fixed.  Unfortunately
some people "cannot or do not wish to use Subversion (svn)."  Is it
possible to get the daily snapshots working again?  6/23 is still the
latest on the website.

	Regards,
	Mike
