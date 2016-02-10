From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 22:29:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 5.6.0
In-Reply-To: <1455137405-20582-1-git-send-email-martin@barkynet.com>
References: <1455137405-20582-1-git-send-email-martin@barkynet.com>
Message-ID: <56BBABBA.70508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-02-16 21:50, Martin Bark wrote:
> This is an important security release. See
> https://nodejs.org/en/blog/release/v5.6.0/ for further details

 It's a security release, but it also carries a bunch of development work. So
I'm not sure if it is 2016.02 material... Still, it's early in the cycle.


> 
> Patches from 5.5.0 have been copied over except for
> 0003-Use-a-python-variable-instead-of-hardcoding-Python.patch which has
> been updated to include some more python variables.

 That patch looks like it should be upstreamable. Has anyone tried?

> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  ...01-Remove-dependency-on-Python-bz2-module.patch |  0
>  .../0002-gyp-force-link-command-to-use-CXX.patch   |  0
>  ...hon-variable-instead-of-hardcoding-Python.patch | 65 +++++++++++++---------
>  .../0004-Fix-va_list-not-declared.patch            |  0
>  .../0005-Fix-support-for-uClibc-ng.patch           |  0
>  package/nodejs/Config.in                           |  2 +-
>  package/nodejs/nodejs.hash                         |  4 +-
>  7 files changed, 43 insertions(+), 28 deletions(-)
>  rename package/nodejs/{5.5.0 => 5.6.0}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
>  rename package/nodejs/{5.5.0 => 5.6.0}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{5.5.0 => 5.6.0}/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch (79%)
>  rename package/nodejs/{5.5.0 => 5.6.0}/0004-Fix-va_list-not-declared.patch (100%)
>  rename package/nodejs/{5.5.0 => 5.6.0}/0005-Fix-support-for-uClibc-ng.patch (100%)


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
