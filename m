From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 23:31:24 +0200
Subject: [Buildroot] [PATCH 06/10] freerdp: bump to version
 9a00b25adc6604f4fbe7c1d69aa4e5663d4d3863
In-Reply-To: <20170804185521.12320-7-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
 <20170804185521.12320-7-Adamduskett@outlook.com>
Message-ID: <236e8248-e624-6c2c-9373-e330f92113c8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 20:55, Adam Duskett wrote:
> This version is compatible with LibreSSL.
> All of the patches previously in the package directory are now also
> either submitted upstream or not relevant anymore.

 Please specify for each patch:
- if it was just a backported upstream patch; or
- if it was accepted upstream (and if it has changed, explain the differences); or
- if upstream has solved it differently; or
- if no longer relevant, why not.


 Also, upstream seems to be making releases again, so perhaps switch to the
2.0.0-rc0 tag instead?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
