From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Jun 2014 20:06:40 +0200
Subject: [Buildroot] [PATCH 1/2] icu: Delete inapropriate flag at link
In-Reply-To: <20140621191459.7a124206@free-electrons.com>
References: <1403194417-19986-1-git-send-email-maxime.hadjinlian@gmail.com>	<53A4A737.9070304@mind.be>
 <20140621191459.7a124206@free-electrons.com>
Message-ID: <53A9BE30.1030901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/06/14 19:14, Thomas Petazzoni wrote:
[snip]
> See also https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=653457 for
> more details.

 That reference (and the failing config) indeed helps. Therefore:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> Hopefully, these details will be enough to justify the patch. Though I
> agree with you that Maxime's description of the patch should have been
> more detailed.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
