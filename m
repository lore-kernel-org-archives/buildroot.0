From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 18:11:05 +0200
Subject: [Buildroot] [PATCH v2] mutt: fix build with
 BR2_PACKAGE_SKELETON_NONE
In-Reply-To: <6e30bce5e2d63e03119cfcd15c88447b6a90256a.1502128454.git.baruch@tkos.co.il>
References: <6e30bce5e2d63e03119cfcd15c88447b6a90256a.1502128454.git.baruch@tkos.co.il>
Message-ID: <8c6986ab-d0d6-d8cc-ccba-a54a09f8331c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-08-17 19:54, Baruch Siach wrote:
> BR2_PACKAGE_SKELETON_NONE does not provide the /var subdirectory which break
> symlink creation in that directory. Make sure that /var exists before creating
> the symlink.

 Commit message should be wrapped at 72 columns.

> 
> Fixes:
> http://autobuild.buildroot.net/results/32d/32dff0df759baf1120e4f11335e735eb0708b237/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Applied to master with that fixed, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
