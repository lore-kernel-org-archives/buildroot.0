From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 01:48:25 +0100
Subject: [Buildroot] [PATCH 24/84 RFC] package/php: use 'menuconfig'
 instad of 'config'+'menu'
In-Reply-To: <7f07ff3547359b272d229ebd4ca3740b7c6eff84.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <7f07ff3547359b272d229ebd4ca3740b7c6eff84.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56871E59.4090803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:24, Yann E. MORIN wrote:
> Move the external extensions selection into the bundled extensions'
> Config.in.
> 
> Make the menu prompt a comment, reword it so that it is more in line
> with the following comments.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I still think it looks really weird that you have XSL and then php-geoip.
Perhaps we should consider letting go of the rule that the prompt should be the
exact package name, and instead make it plain geoip. But that's more churn...

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
