From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 10:07:05 +0100
Subject: [Buildroot] [PATCH v2] wf111: new package
In-Reply-To: <1422974005-21617-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1422974005-21617-1-git-send-email-antoine.tenart@free-electrons.com>
Message-ID: <20150220100705.19371d65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Antoine Tenart,

On Tue,  3 Feb 2015 15:33:25 +0100, Antoine Tenart wrote:
> Adds support for the BlueGiga WF111 WiFi driver and the binary utilities
> distributed alongside the driver. An account is required to download the
> sources from the BlueGiga website, which can be created freely. The
> driver is available for armv5, arm7a and i386.
> 
> Since it is not possible to automatically retrieve the sources, because
> of the required user account needed on the BlueGiga website, an option
> is added to let the Buildroot user specify the directory where the
> driver tarball was downloaded.
> 
> Finally, two options must be selected in the Linux kernel configuration:
> CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV. These are blind options (i.e.
> not selectable directly) so they cannot be enabled by a change in
> linux/linux.mk. The user as two choices to enable these options:
> - By making them non blind, with a "WF111 support" configuration entry
>   for example.
> - By enabling another WiFi driver that select them.
> 
> The work behind this commit was funded by ECA Group
> <http://www.ecagroup.com>. ECA Group is the copyright owner of the
> contributed code.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Thanks, applied to next. It would be good however to send a followup
patch adding <pkg>_LICENSE and <pkg>_LICENSE_FILES.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
