From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 19:23:32 +0200
Subject: [Buildroot] [PATCH v4 1/1] flatcc: new package
In-Reply-To: <1527786269-11147-1-git-send-email-joel.carlson@cosmicaes.com>
References: <1527786269-11147-1-git-send-email-joel.carlson@cosmicaes.com>
Message-ID: <20180605192332.3e7e2611@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 May 2018 11:04:29 -0600, Joel Carlson wrote:
> This adds flatcc as a new package, pulling v0.5.1 from github. flatcc
> has both a host tool (the compiler), and libraries for the target.
> 
> Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
> Signed-off-by: Joel Carlson <joel.carlson@cosmicaes.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> Changes v3 -> v4
>   - Put back in Sob line of original submitter (suggested by Arnout)
>   - Removed pruning of host files (suggested by Arnout)
> ---
>  package/Config.in          |  1 +
>  package/flatcc/Config.in   |  8 ++++++++
>  package/flatcc/flatcc.hash |  2 ++
>  package/flatcc/flatcc.mk   | 29 +++++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 package/flatcc/Config.in
>  create mode 100644 package/flatcc/flatcc.hash
>  create mode 100644 package/flatcc/flatcc.mk

The entry in the DEVELOPERS file was missing, so I've added that and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
