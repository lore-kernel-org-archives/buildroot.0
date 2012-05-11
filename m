From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Fri, 11 May 2012 09:51:34 +0100
Subject: [Buildroot] [PATCH] gpsd: Add package version to libgpsmm patch
In-Reply-To: <20120511104341.33990e92@skate>
References: <1333628924-8966-1-git-send-email-markos.chandras@imgtec.com>
 <20120511104341.33990e92@skate>
Message-ID: <4FACD316.9050907@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/2012 09:43 AM, Thomas Petazzoni wrote:

> Le Thu, 5 Apr 2012 13:28:44 +0100,
> Markos Chandras <markos.chandras@imgtec.com> a ?crit :
> 
>>  package/gpsd/gpsd-2.95-fix-libgpsmm.patch |   23 +++++++++++++++++++++++
>>  package/gpsd/gpsd-fix-libgpsmm.patch      |   23 -----------------------
> 
> Actually these days, the idea is just the opposite: remove the version
> from the patch names. So it's the other patches that should be renamed
> <pkg>-<description>.patch instead of
> <pkg>-<version>-<description>.patch.
> 
> Regards,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

Hi Thomas,

Ok I didn't know what the preferred way of fixing this problem was. I
will prepare a new patch then.

-- 
markos
