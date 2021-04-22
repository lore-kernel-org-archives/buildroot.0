From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 21:32:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/sdl_mixer: fix static build
 with tremor
In-Reply-To: <20210410100554.3947392-2-fontaine.fabrice@gmail.com>
References: <20210410100554.3947392-1-fontaine.fabrice@gmail.com>
 <20210410100554.3947392-2-fontaine.fabrice@gmail.com>
Message-ID: <20210422213248.6beeafa7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Apr 2021 12:05:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Static build with tremor raises a build failure since bump to latest git
> tree in commit c8e27f3baa90351a417ff6e172d214c4a72e7314. However, it
> should be noted that before this bump, tremor was always disabled in
> static builds because vorbisidec detection was broken until
> https://github.com/libsdl-org/SDL_mixer/commit/565a9a27cc8c184ad0203f004b834880ffd45d32
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9634adc433da0e25732eb98675c59d0f96ac93b2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...re.ac-fix-static-linking-with-tremor.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch

Your patch did not apply properly. But since it was applied upstream,
I've taken the upstreamed patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
