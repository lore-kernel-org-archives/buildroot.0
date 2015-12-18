From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Dec 2015 23:23:20 +0100
Subject: [Buildroot] buildroot support for OrangePI PC
In-Reply-To: <08485173-6FC7-42EF-9BFE-7B3B9967EEC0@xiot.nl>
References: <08485173-6FC7-42EF-9BFE-7B3B9967EEC0@xiot.nl>
Message-ID: <56748758.7040908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-12-15 14:22, Eelco Chaudron wrote:
> Hi All,
> 
> Was wondering if anyone has started working on OrangePi PC board support?

 Not that I know of. But it should be quite similar to the cubieboard I think.

 If you make a defconfig for it, consider using genimage rather than a custom
script like mkcubiecard.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
