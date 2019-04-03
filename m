From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Thu, 4 Apr 2019 01:23:13 +0700
Subject: [Buildroot] [PATCH v3] package/libcamera: Add libcamera package
In-Reply-To: <4b4aeae9-67d5-f958-91ad-cfb0db784c2d@mind.be>
References: <20190403112902.29930-1-kieran.bingham@ideasonboard.com>
 <4b4aeae9-67d5-f958-91ad-cfb0db784c2d@mind.be>
Message-ID: <463828c0-337d-62f6-6d0e-7e9b00152600@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 03/04/2019 12:32, Arnout Vandecappelle wrote:
> 
> 
> On 03/04/2019 13:29, Kieran Bingham wrote:
>> +LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
>> +LIBCAMERA_VERSION = d5ca33f6c7b0cd1ca20ec5dc7131aeedf1503080
>> +LIBCAMERA_SITE_METHOD = git
> 
>  That debug line gave me the idea... you can use an http download on gitlab:

Thanks, but we're not actually using gitlab. That was a repo I had
control over which I was able to push public branches to for testing and
debugging the buildroot build.

> LIBCAMERA_SITE =
> https://gitlab.com/libcamera/libcamera/-/archive/$(LIBCAMERA_VERSION)
> LIBCAMERA_SOURCE = libcamera-$(LIBCAMERA_VERSION).tar.bz2
> 
>  Only, I'm not sure how stable the tarball generation is, i.e. if it will always
> yield the same hash.

I'm afraid I don't believe this would work with the git.linuxtv.org ...
I think it's just a basic gitolite instance or such.

>  Either way:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Great thanks.


> 
>  Regards,
>  Arnout
> 

-- 
Regards
--
Kieran
