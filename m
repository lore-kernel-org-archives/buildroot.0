From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2012 10:07:14 +0100
Subject: [Buildroot] [PATCH] DOWNLOAD: change $1=DIRECTORY_URL,
	$2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <CAM+bi4vnNpcZoHmPBVvoxT_NSan+JJw2wgTpGuUBzAi14jtf8g@mail.gmail.com>
References: <CAM+bi4s6tQ0RpfqgjGtqpT0ym=WMPvROgyVsxdzKsx0GeKwtHg@mail.gmail.com>
 <201202160040.17980.arnout@mind.be>
 <CAM+bi4vnNpcZoHmPBVvoxT_NSan+JJw2wgTpGuUBzAi14jtf8g@mail.gmail.com>
Message-ID: <201202161007.14327.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 16 February 2012 09:31:51 Alvaro Gamez wrote:
> I've just learned that wget has the option --content-disposition which
> manages to set the right filename even in URLs like that from Xilinx.
> Although it seems to have some drawbacks, maybe it could be used whenever
> the second argument of DOWNLOAD is not defined. Should I set it then?

 Doesn't help much, because there's no guarantee that the downloaded 
filename is what the buildroot makefiles expect it to be.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
