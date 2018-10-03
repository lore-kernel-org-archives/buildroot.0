From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 02 Oct 2018 21:49:23 -0300
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: URL
 checking support
References: <1538447849-46511-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5bb4121367d27_6f722adebcbf0bd8653a4@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 01, 2018 at 11:37 PM, Matt Weber wrote:

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

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
