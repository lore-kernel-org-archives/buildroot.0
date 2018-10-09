From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 10:15:25 +0200
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: URL
 checking support
In-Reply-To: <1538447849-46511-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1538447849-46511-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181009101525.4e39bd35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Oct 2018 21:37:28 -0500, Matt Weber wrote:
>  - Adds support to check if a package has a URL and if that URL
>    is valid by doing a header request.
>  - Reports this information as part of the generated html output
> 
> The URL data is currently gathered from the URL string provided
> in the Kconfig help sections for each package.
> 
> This check helps ensure the URLs are valid and can be used
> for other scripting purposes as the product's home site/URL.
> CPE XML generation is an example of a case that could use this
> product URL as part of an automated update generation script.
> 
> CC: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v2 -> v3
> [Ricardo
>  - Fixed flake8 warnings of extra lines and unused variable
>  - Adjusted regex to be compiled once and used example to
>    simplify finding the url and cleaning up the string
>  - Removed checking for help section and instead used the suggested
>    improved regex to find the URL.

Applied to master, thanks. I have just changed the header of the column
from "URL" to "Upstream URL".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
