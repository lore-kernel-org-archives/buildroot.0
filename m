From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Nov 2014 08:24:06 -0600
Subject: [Buildroot] [PATCH] omniorb: fix build for uclinux
In-Reply-To: <422d20cafc39916b91202d92cd2641c58b48a301.1416466169.git.baruch@tkos.co.il>
References: <422d20cafc39916b91202d92cd2641c58b48a301.1416466169.git.baruch@tkos.co.il>
Message-ID: <CANQCQpa3VS6OTEex-8LXOvLUumy=XuPRJBv7DnFSTxkcPTh+Qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Thu, Nov 20, 2014 at 12:49 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Add a patch to make configure correctly identify uclinux.
>
> Also, disable build of shared libraries when PREFER_STATIC_LIB is set.
> Otherwise, build for Blackfin fails further down the road.
>
> Fixes:
> http://autobuild.buildroot.net/results/c60/c60d880b620c47f4aa03cdf2e1bb85a526242d54/
> http://autobuild.buildroot.net/results/01f/01f4e8a27831d6817b329fa23fe0bbabd7fd01c9/
> http://autobuild.buildroot.net/results/a96/a96a06b825c14dc9fdf738225db50bc1de8b901a/
>
<snip>

Thanks for resolving this!

Acked-by: Matt Weber <matthew.weber@rockwellcollins.com>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
