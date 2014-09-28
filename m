From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Sep 2014 12:47:08 +0200
Subject: [Buildroot] Analysis of build failures
References: <20140914063013.2E5D2100F07@stock.ovh.net>
 <20140914121904.0c2ebcbd@free-electrons.com>
Message-ID: <XnsA3B6820FA4BA2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140914121904.0c2ebcbd at free-electrons.com:

>>          arm |                      vlc-2.1.5 | NOK | 
http://autobuild.buildroot.net/results/2d2bbd633dc09e7471e8b48be39b74fb1bf633
6f/
> main_interface.moc.cpp:14:2: error: #error "This file was generated using 
the moc from 4.6.3. It"
>  #error "This file was generated using the moc from 4.6.3. It"
>   ^
> main_interface.moc.cpp:15:2: error: #error "cannot be used with the include 
files from this version of Qt."
>  #error "cannot be used with the include files from this version of Qt."
> Qt/VLC issue. Bernd?

Hi,

I can not reproduce this build error, maybe a local moc binary is getting in 
the way here?

Regards, Bernd
