From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 23:20:26 +0100
Subject: [Buildroot] [PATCH v2 1/2] support/testing: add assertRunOk
 method to BRTest class
In-Reply-To: <20191120133952.22978-1-patrick.havelange@essensium.com>
References: <20191120133952.22978-1-patrick.havelange@essensium.com>
Message-ID: <20191120232026.4e9c52e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Nov 2019 14:39:51 +0100
Patrick Havelange <patrick.havelange@essensium.com> wrote:

> This method asserts that the given command ran successfully.
> The goal is for it to be used by the different tests when needed.
> 
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> 
> ---
> Changes
> v1 -> v2
> [Thomas
>  - Moved this function to the BRTest class
>  - Removed unnecessary "sh -c"
> ---
>  support/testing/infra/basetest.py | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
