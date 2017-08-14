From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:03:54 +0200
Subject: [Buildroot] [PATCH 2/3] whois: use github repo as home page
In-Reply-To: <fa924d0754ef385b1706721751e5f6f00e60c199.1502649259.git.baruch@tkos.co.il>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
 <fa924d0754ef385b1706721751e5f6f00e60c199.1502649259.git.baruch@tkos.co.il>
Message-ID: <20170814220354.3665d3eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Aug 2017 21:34:18 +0300, Baruch Siach wrote:
> The github repo is more informative than the list Marco's software on
> the previous link.
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

What about switching the upstream to be Github, instead of fetching
from Debian? The Github repo has all the releases available:
https://github.com/rfc1036/whois/releases.

Just make sure that the 5.2.14 tarball we were getting from Debian is
similar in contents to what we get from the Github repository for the
same version.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
