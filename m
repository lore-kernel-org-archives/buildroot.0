From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Apr 2017 09:23:29 +0200
Subject: [Buildroot] [PATCH v4] libgphoto2: new package
In-Reply-To: <1491894008-29767-1-git-send-email-kevin.joly@sensefly.com>
References: <1491894008-29767-1-git-send-email-kevin.joly@sensefly.com>
Message-ID: <71951810-c9a3-4fac-4a45-5c94651c81b7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Kevin,

On 11-04-17 09:00, Kevin JOLY wrote:
> Add support for libgphoto2 core library designed to allow access to
> digital camera.
> 
> Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 When you make any non-trivial change, like changing the libjpeg dependency into
jpeg, you really shouldn't keep the Ack.

 However, I would have given it anyway, so all is good :-)


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
