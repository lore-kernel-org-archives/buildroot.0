From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 14:09:47 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.55.0
In-Reply-To: <4f33b3435349660c4e3f2b444104442e6a9498b1.1502386545.git.baruch@tkos.co.il>
References: <4f33b3435349660c4e3f2b444104442e6a9498b1.1502386545.git.baruch@tkos.co.il>
Message-ID: <697a4e21-8454-4c3d-99c3-ed66bafbb004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-08-17 19:35, Baruch Siach wrote:
> Fixes:
> 
>  glob: do not parse after a strtoul() overflow range (CVE-2017-1000101)
>  tftp: reject file name lengths that don't fit (CVE-2017-1000100)
>  file: output the correct buffer to the user (CVE-2017-1000099)
> 
> Switch to .tar.xz to save bandwidth.
> 
> Add reference to tarball signature.

 Nice!

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
