From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 23:00:45 +0100
Subject: [Buildroot] [PATCH 1/2] vboot-utils: new package
In-Reply-To: <20151116215244.GA8630@vostro>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <39f87349d2f42ac5d2acec7a00c94c4e5e9400a8.1447689401.git.alex.suykov@gmail.com>
 <564A3A5F.3010301@mind.be> <20151116215244.GA8630@vostro>
Message-ID: <564A520D.9010506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-11-15 22:52, Alex Suykov wrote:
> Mon, Nov 16, 2015 at 09:19:43PM +0100, Arnout Vandecappelle wrote:
> 
>>> +	  ChromeOS verified boot utils: futility and cgpt.
>>
>>  ChromeOS or Chromius OS? Please be consistent :-)
>  
> Fixed that in v2 already. Should be Chromium OS throughout of course.
> Chromium OS but Chrome-book.

 Yeah sorry I was replying to the wrong version.

> 
>>> +VBOOT_UTILS_VERSION = bbdd62f9b030db7ad8eef789aaf58a7ff9a25656
>>> +VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
>>
>>  Since googlesource is shutting down: is there an alternative location already?
>> Possibly one which doesn't require git download method?
> 
> Isn't it Google Code that's shutting down?

 Oops, my bad.


> It does not look like they have any other site for Chromium OS sources.
> https://www.chromium.org/chromium-os/developer-guide#TOC-Get-the-Source
> 
> They do have tgz shapshots however, I overlooked that.
> Should be better than git checkouts.

 All right, so my comments weren't completely useless :-)

 Don't forget to add a hash file then.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
