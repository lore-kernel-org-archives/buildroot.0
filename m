From: Patrick <kpa_info@yahoo.fr>
Date: Wed, 09 Jan 2013 09:45:12 +0100
Subject: [Buildroot] Error when adding media-ctl as package
In-Reply-To: <20130109092722.7cb8409b@skate>
References: <50EC1EBF.80807@yahoo.fr> <50EC7F16.3090008@mind.be>
 <50ED24FE.3070703@yahoo.fr> <20130109092722.7cb8409b@skate>
Message-ID: <50ED2E18.8070502@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2013 09:27 AM, Thomas Petazzoni wrote:
> Dear Patrick,
> Could you add:
>
> MEDIA_CTL_DEPENDENCIES = host-pkgconf
>
> in your media-ctl.mk file?
>
>

Dear Thomas,

Thanks that it, issues fixed ! Thanks

I now have another issue:

checking linux/media.h usability... no
checking linux/media.h presence... no
checking for linux/media.h... no
ERROR: Kernel header file not found or not usable!

I think that a "make headers_install" is missing when compiling the 
kernel. I use a buildroot external toolchain. How could I say to 
buildboot to add the "make headers_install" step ?

Thanks in advance

Patrick
