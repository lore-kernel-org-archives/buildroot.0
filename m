From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 4 Aug 2017 22:01:13 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-07-31
In-Reply-To: <20170801063048.E1A5E20C14@mail.free-electrons.com>
References: <20170801063048.E1A5E20C14@mail.free-electrons.com>
Message-ID: <5fddab52-cf68-20a3-2c57-efea72323008@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/08/2017 ? 08:30, Thomas Petazzoni a ?crit :
> Hello,
> 
> Build statistics for 2017-07-31
> ================================
> 
>       successes : 165
>        failures : 18 
>        timeouts : 0  
>           TOTAL : 183
> 
> Classification of failures by reason
> ====================================
> 
>                      gpsd-3.16 | 2 
>          libspatialindex-1.8.5 | 1 
> 
> Detail of failures
> ===================
> 
> microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/64a0bec7efe5b63a2b315bd204fb50884d62f0a8 |     
> microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/4c240106fb29805382d5ae347e65b6f83d5033d4 |     
> microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/3cd4bb438158e6f848072af1acae876a8a44ef88 |     

Following the removal of gdb on microblaze, what do we do for this toolchain
issue? You reported the bug last year without any feedback [1].

I would suggest adding an autobuilder exception on these two packages.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69401

Best regards,
Romain
