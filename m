From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2016 15:55:02 +0100
Subject: [Buildroot] Possible documentation error and a patch
In-Reply-To: <193601d24331$ffd8ea30$ff8abe90$@chordia.co.uk>
References: <193601d24331$ffd8ea30$ff8abe90$@chordia.co.uk>
Message-ID: <20161120155502.28130680@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 13:28:36 -0000, jerry at chordia.co.uk wrote:
> Greetings. 
> 
> I think the example here
> http://nightly.buildroot.org/manual.html#outside-br-custom has a couple of
> typos?
> 
> The example layout has $BR2_EXTERNAL_BAR_42_DIR instead of
> $BR2_EXTERNAL_BAR_42_PATH in a couple of places and the source lines in the
> example config.in are incorrectly quoted.
> 
> If I've read this correctly please find patch attached.
> 
> BR,
> 
> Jerry
> 
> Signed-off-by: Jerry Evans g4 at novadsp.com
> ---
>  docs/manual/customize-outside-br.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks, I've applied your patch to master. However, I had to:

 - Rewrite entirely the commit message, because yours contained some
   irrelevant information for a commit log.

 - Adjust your SoB line: your e-mail should have been enclosed in <...>

 - Fix line wrapping in your patch. Please use 'git send-email' next
   time to send your patch, and not Outlook.

Thanks for having reported and fixed this issue!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
