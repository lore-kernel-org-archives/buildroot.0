From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 25 Mar 2016 23:54:37 +0100
Subject: [Buildroot] [git commit] pulseview: needs boost
	atomic/date_time as	well
References: <20160325215140.07917800F2@busybox.osuosl.org>
Message-ID: <d6sgscxrmh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 25 Mar 2016 22:48:16 +0100 schrieb Peter Korsgaard:

> From the cmake log:
> 
>   Could not find the following Boost libraries:
> 
>           boost_date_time boost_atomic
> 
>   Some (but not all) of the required Boost libraries were found.  You
>   may need to install these additional Boost libraries.  Alternatively,
>   set BOOST_LIBRARYDIR to the directory containing Boost libraries or
>   BOOST_ROOT to the location of Boost.

Hi Peter,

building pulseview with this patch reverted works after the cmake bump to 
3.5.1.

Regards, Bernd
