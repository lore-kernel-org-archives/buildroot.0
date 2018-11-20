From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 09:01:34 +0100
Subject: [Buildroot] [next] test_rust: use standard defconfig fragment
 style
In-Reply-To: <20181116222147.13887-1-ricardo.martincoski@gmail.com>
References: <20181116222147.13887-1-ricardo.martincoski@gmail.com>
Message-ID: <20181120090134.477ce99e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Nov 2018 20:21:47 -0200, Ricardo Martincoski wrote:
> Since commit "2927f412be support/testing: standardize defconfig
> fragments style" all other test cases use the same style for defconfig
> fragments:
>  - start after a backslash;
>  - be declared as a multi-line string literal;
>  - be indented one level more than the variable that contains it.
> 
> Do the same here for consistency.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  support/testing/tests/package/test_rust.py | 78 +++++++++++-----------
>  1 file changed, 39 insertions(+), 39 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
