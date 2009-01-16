From: Robert Nelson <robert.nelson.work@gmail.com>
Date: Fri, 16 Jan 2009 14:59:26 -0600
Subject: [Buildroot] buildroot 2009.02-rc1 releases [atngw100]
In-Reply-To: <87ab9r3u6k.fsf@macbook.be.48ers.dk>
References: <87ab9r3u6k.fsf@macbook.be.48ers.dk>
Message-ID: <4970F52E.8070002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/16/2009 1:52 PM, Peter Korsgaard wrote:
> Hi,
>
> With the source mirror stuff in place, we have all the features
> required for the release, so I have released buildroot-2009.02-rc1 as
> promised.
>
> You can get it from:
>
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc1.tar.gz
>
> or
>
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc1.tar.bz2
>
> Please give it a spin and report back issues to the mailing list or
> the bug tracker.
>
> The plan is still to release the final 2009.02 release by FOSDEM
> (February 7th).
>
> Notice: I have NOT created a release branch as I want the release to
> get as much testing as possible, so PLEASE only commit fixes to the
> tree until we have the release out the door.
>
>    

Hello guys,

atngw100_defconfig's failing, for some reason "4.2.2" isn't being 
correctly past with "BR2_GCC_VERSION" from the defconfig to the build.

Started with a fresh download, 'make atngw100_defconfig', 'make'...

Build system: debian lenny amd64

*******
#rm -f 
/media/mirror/testing/buildroot-2009.02-rc1/build_avr32/staging_dir/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip}
mkdir -p /media/mirror/testing/buildroot-2009.02-rc1/dl
--2009-01-16 14:37:42--  
ftp://www.at91.com/pub/buildroot//gcc--avr32-1.1.3.tar.bz2
            => 
`/media/mirror/testing/buildroot-2009.02-rc1/dl/gcc--avr32-1.1.3.tar.bz2'
Resolving www.at91.com... 194.2.24.29
Connecting to www.at91.com|194.2.24.29|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /pub/buildroot/ ... done.
==> SIZE gcc--avr32-1.1.3.tar.bz2 ... done.
==> PASV ... done.    ==> RETR gcc--avr32-1.1.3.tar.bz2 ...
No such file `gcc--avr32-1.1.3.tar.bz2'.

--
Robert Nelson
http://www.rcn-ee.com/
