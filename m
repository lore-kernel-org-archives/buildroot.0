From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 25 Apr 2012 16:47:53 +0100
Subject: [Buildroot] [PATCH] xf86-input-vmmouse: Make xf86-input-vmmouse
 available only to x86/x86_64 architectures
In-Reply-To: <20120425174238.68b9b354@skate>
References: <1335368289-19192-1-git-send-email-markos.chandras@imgtec.com>
 <20120425174238.68b9b354@skate>
Message-ID: <4F981CA9.4060900@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/25/2012 04:42 PM, Thomas Petazzoni wrote:

> Le Wed, 25 Apr 2012 16:38:09 +0100,
> Markos Chandras <markos.chandras@imgtec.com> a ?crit :
> 
>> diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
> b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
>> index 377e7e4..dc24691 100644
>> --- a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
>> +++ b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
>> @@ -1,3 +1,4 @@
>> +if BR2_i386 || BR2_x86_64
> 
> I would prefer a
> 
>         depends on BR2_i386 || BR2_x86_64
> 
> below:
> 
> config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
>         bool "xf86-input-vmmouse"
> 
> because that's what we do for all other packages.
> 
> Thomas


Hi Thomas,

Thanks. A new patch is coming asap

-- 
markos
