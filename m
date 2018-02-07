From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 00:19:10 +0100
Subject: [Buildroot] [PATCH v2 2/2] xf86-video-armada: new package
In-Reply-To: <CAOMZO5Bb0-Ng=OYi1EqXsKWsQTHuCkO+fyCktcZqCa-GjVaxpQ@mail.gmail.com>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
 <20180202145526.20133-3-Evgeniy.Didin@synopsys.com>
 <CAOMZO5Bb0-Ng=OYi1EqXsKWsQTHuCkO+fyCktcZqCa-GjVaxpQ@mail.gmail.com>
Message-ID: <410be6fe-78b6-2898-adaf-a9a1abfdd53c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-18 17:25, Fabio Estevam wrote:
> Hi Evgeniy,
> 
> On Fri, Feb 2, 2018 at 12:55 PM, Evgeniy Didin
> <Evgeniy.Didin@synopsys.com> wrote:
> 
>> +++ b/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash
>> @@ -0,0 +1,6 @@
>> +# Locally calculated
>> +sha256 5df615507ca6579ffba6df8a2aea6f6b542aa3985598efae836f335f9752cb39        xdriver_xf86-video-armada-04748ff4fb30370086cc97b9487a32951c5600ba.tar.gz
> 
> I had to manually change the sha256 to
> 5df615507ca6579ffba6df8a2aea6f6b542aa3985598efae836f335f9752cb39 in
> order to fix the mismatch error.

 My cmp-foo may be off, but that is what is in the hash file, no?

 Regards,
 Arnout

> 
> With this fixed:
> 
> Tested-by: Fabio Estevam <festevam@gmail.com>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
