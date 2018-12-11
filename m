From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Dec 2018 13:56:11 +0100
Subject: [Buildroot] [PATCH] i2c-tools: bump to version 4.1
In-Reply-To: <4bd477748470d4560a70b6d2e297eb747ef2f4c3.1544529126.git.baruch@tkos.co.il>
References: <4bd477748470d4560a70b6d2e297eb747ef2f4c3.1544529126.git.baruch@tkos.co.il>
Message-ID: <48b39a35-34eb-0bd0-97bd-cf8968652570@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/12/2018 12:52, Baruch Siach wrote:
> Drop upstream patches.
> 
> Rename 'prefix' to 'PREFIX' following upstream change.
> 
> Update README hash for build documentation changes unrelated to license.

 Actually, IMO the text in README is not that valuable:

Check the documentation of individual tools for licensing information.
The library is released under the LGPL version 2.1 or later, while most
tools are released under the GPL version 2 or later, but there are a few
exceptions.

 This adds nothing to the license info we have already...

 But that's a separate patch anyway, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 BTW, most changes in this release are bugfixes, but I think we already had all
of those as patches; the feature changes are
7028042 tools: add all_addrs option for i2c tools
and a bunch of commits to add DDR4 support to decode-dimms.

 Since the bugfixes are already in the stable branches, this is not for stable.

 Regards,
 Arnout

> 
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
