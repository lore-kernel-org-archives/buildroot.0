From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2012 09:15:18 +0100
Subject: [Buildroot] buildroot-2012.08: Handling drm module
In-Reply-To: <785D21F16C354A27B5E83E9F56FEA59B@ZviVeredPC>
References: <CABRndgxqqO3HC08rVngxm2eaSVjQ9Ks04U7Mss5-xu=B4WGMdg@mail.gmail.com>
 <50A029E0.4020802@mind.be> <785D21F16C354A27B5E83E9F56FEA59B@ZviVeredPC>
Message-ID: <50A0B016.4030402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/12 04:58, Zvi Vered wrote:
> Hello,
>
> Build is OK.
> The resulting image boots OK.
> But the screen flickers with this image.
> The image was not built with buildroot.

  So, why are you asking this on the buildroot mailing list then?

> I built vanilla 3.4.7 downloaded from kernel.org
>
> With knoppix 7.0.4, when I boot with: "knoppix 2" there is no flickering.
> When I boot with "knoppix 2 nodrm" the screen flickers.
>
> Is "nodrm" a boot parameter (like vga=normal) ?

  I have no idea - perhaps a question to ask on the knoppix mailing list?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
