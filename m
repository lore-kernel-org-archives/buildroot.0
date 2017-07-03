From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 00:58:04 +0200
Subject: [Buildroot] [PATCH v14 1/4] makedevs: support optional files
In-Reply-To: <20170703210051.3457-1-arnout@mind.be>
References: <20170703210051.3457-1-arnout@mind.be>
Message-ID: <20170704005804.672295a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Jul 2017 23:00:48 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Add the 'F' file type to makedevs, that allows a file to be optional.
> With this option, the line is just silently skipped if the file doesn't
> exist (or is not a regular file).
> 
> This is useful for _PERMISSIONS where the file can be configured out
> by package-specific configuration that is not directly handled by
> Buildroot, like busybox.
> 
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> Cc: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v14:
>  - Split off the makedevs change in a separate patch.
>  - Fix it - AFAICS, the original patch would just skip all F lines.
> ---
>  package/makedevs/makedevs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
