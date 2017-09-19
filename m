From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 23:01:56 +0200
Subject: [Buildroot] [PATCH v2] support/scripts/apply-patches.sh: do not
 apply patches with renames
In-Reply-To: <20170624195936.31528-1-thomas.petazzoni@free-electrons.com>
References: <20170624195936.31528-1-thomas.petazzoni@free-electrons.com>
Message-ID: <186d2d2e-a3e0-792f-63b7-24a3ac1d4d41@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-06-17 21:59, Thomas Petazzoni wrote:
> Patches with renames apply properly with patch >= 2.7, but not with
> older patch versions. Since "git format-patch" by default generates
> patches with renames, Buildroot developers often don't realize that
> their patches will not apply properly on build machines that have
> patch < 2.7. In order to prevent such a situation from happening
> again, this commit adds some logic in apply-patches.sh to refuse
> applying patches that contain renames.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Applied to master after incorporating Yann's and my suggestions, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
