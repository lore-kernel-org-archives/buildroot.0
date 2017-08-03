From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Aug 2017 09:06:56 +0200
Subject: [Buildroot] [PATCH v3] qt5wayland: new package
In-Reply-To: <1501535208-8161-1-git-send-email-joshua.henderson@microchip.com>
References: <1501535208-8161-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <e5d8c8ca-0aae-0d3d-2c19-3e520318345a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-07-17 23:06, Joshua Henderson wrote:
> QtWayland is a Qt 5 module that wraps the functionality of Wayland.
> 
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Brent Sink <brents_3@hotmail.com>
> Cc: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

 Hi Joshua,

 I've applied to the next branch, with a few fixes:

     - select wayland instead of depending on it;
     - propagate jscore dependency from qt5declarative
     - re-order select/depends statements
     - rewrite comment to only refer to GL backend (jscore is an arch
       dependency)
     - rewrap help text of BR2_PACKAGE_QT5WAYLAND_COMPOSITOR

 Could you also add yourself to the DEVELOPERS file for this package and others
you are interested in? Then you will get a mail whenever these packages fail in
the autobuilders.


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
