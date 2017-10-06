From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 18:47:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump to
 version 2.4.28
In-Reply-To: <20171006052430.8546-1-bernd.kuhls@t-online.de>
References: <20171006052430.8546-1-bernd.kuhls@t-online.de>
Message-ID: <745291d9-523b-e484-cc20-d0235d1bcbc8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-10-17 07:24, Bernd Kuhls wrote:
> Fixes CVE-2017-9798: https://nvd.nist.gov/vuln/detail/CVE-2017-9798
> 
> Removed patch applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>


 Applied to master after removing the "security" label as suggested by Baruch,
thanks.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
