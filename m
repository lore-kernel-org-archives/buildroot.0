From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:50:21 +0200
Subject: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/sample_gst1_python.py: fix flake8 errors
In-Reply-To: <20200328212651.2715515-1-aduskett@gmail.com>
References: <20200328212651.2715515-1-aduskett@gmail.com>
Message-ID: <20200329155021.4ed71f87@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Mar 2020 14:26:50 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> The older version of flake8 on the autobuilders does not support typehints.
> As such, flake8 throws the following error when scanning sample_gst1_python:
> E999 SyntaxError: invalid syntax
> 
> Remove the typehinting from on_message to fix this issue.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  support/testing/tests/package/sample_gst1_python.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
