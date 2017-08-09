From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 00:32:45 +0200
Subject: [Buildroot] [PATCH] expat: bump to version 2.2.3
In-Reply-To: <f979d2acf92198414d7ef6b54aa930cc634d50ba.1502257189.git.baruch@tkos.co.il>
References: <f979d2acf92198414d7ef6b54aa930cc634d50ba.1502257189.git.baruch@tkos.co.il>
Message-ID: <fd7b47a1-cb64-c4cc-c3b8-7a489e85b060@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-08-17 07:39, Baruch Siach wrote:
> Drop the XML_POOR_ENTROPY workaround. Upstream commit fd9581a34e5665
> (Never require XML_POOR_ENTROPY for "./configure && make") fixes this
> issue.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Applied to next, thanks.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
