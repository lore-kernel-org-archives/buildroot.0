From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 01 Apr 2015 21:28:21 +0200
Subject: [Buildroot] [PATCH 02/18] package/mplayer: add optional giflib
 support
In-Reply-To: <XnsA46EE11448266berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-3-git-send-email-bernd.kuhls@t-online.de>
 <20150330225658.091b8e72@free-electrons.com>
 <20150330230606.2702a000@free-electrons.com> <551AE9C1.70701@mind.be>
 <XnsA46EE11448266berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <551C46D5.2020501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/03/15 22:07, Bernd Kuhls wrote:
> Arnout Vandecappelle <arnout@mind.be> wrote in 
> news:551AE9C1.70701 at mind.be:
> 
>>  For the positive case (--enable-termcap), autodetection should be fine. 
> 
> Hi,
> 
> no, it is broken:

 I meant, in case termcap is available, it should be OK to build without
--enable-termcap because in that case the configure script adds the required libs.


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
