From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 21:43:41 +0200
Subject: [Buildroot] [PATCH v3 0/6] engicam: Add new boards and qt5
In-Reply-To: <CAD6G_RQovcgik+Kkz_s7jwN_0ztkbmqWF3Kax4w-i67BEn6fTQ@mail.gmail.com>
References: <1505302931-17387-1-git-send-email-jteki@openedev.com>
 <CAD6G_RTdxRj=7G0xoqvGWLsjO5aSCrLe1qZrPn6YU6uoevZj4Q@mail.gmail.com>
 <CAD6G_RQovcgik+Kkz_s7jwN_0ztkbmqWF3Kax4w-i67BEn6fTQ@mail.gmail.com>
Message-ID: <8e135a7e-57ad-9e40-f482-45bf97900240@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jagan,

On 27-09-17 19:57, Jagan Teki wrote:
> 
> 
> On 21-Sep-2017 6:05 PM, "Jagan Teki" <jagannadh.teki@gmail.com
> <mailto:jagannadh.teki@gmail.com>> wrote:
> 
>     On Wed, Sep 13, 2017 at 5:12 PM, Jagan Teki <jagannadh.teki@gmail.com
>     <mailto:jagannadh.teki@gmail.com>> wrote:
>     > From: Jagan Teki <jagan@amarulasolutions.com
>     <mailto:jagan@amarulasolutions.com>>
>     >
>     > This series add new boards from Engicam with qt5 support for each.
>     >
>     > Jagan Teki (6):
>     >? ?engicam: imx6qdl_icore: Bump to latest Linux and uboot releases
>     >? ?board: icorem6: Add Qt5 configs for 800x480 LVDS display
>     >? ?engicam: icorem6: Add OF C.TOUCH 10.1 Kit
>     >? ?board: icorem6: Add Qt5 configs for 1280x800 LVDS display
>     >? ?engicam: icorem6: Add OF C.TOUCH 12 Kit
>     >? ?board: icorem6: Add Qt5 configs for 1280x480 LVDS display
> 
>     Any comments on this?
> 
> 
> We're planning to send GST patches on top of this series, would you please comment.


 I've been wary about applying this patch series because we don't really want
qt5 defconfigs for every board. Especially since we already have a mx6/Etnaviv
defconfig (imx6-sabresd_qt5_defconfig). Initially I even thought you were adding
three different qt5 defconfigs... But fortunately it's just one.

 That said, since you're clearly actively working with this, it's worth
including it.

 Peter, Thomas, opinions?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
