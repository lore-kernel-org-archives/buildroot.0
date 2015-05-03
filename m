From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 May 2015 10:53:01 +0200
Subject: [Buildroot] [PATCH v5] cc-tool: new package
In-Reply-To: <1430593413-9446-1-git-send-email-arnout@mind.be>
References: <1430593413-9446-1-git-send-email-arnout@mind.be>
Message-ID: <20150503105301.36f1c6c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sat,  2 May 2015 21:03:33 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Marcin Bis <marcin@bis.org.pl>
> 
> cc-tool provides support for Texas Instruments CC Debugger
> 
> Signed-off-by: Marcin Bis <marcin@bis.org.pl>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  [Arnout: avoid adding /usr/local to library path]
> ---
> v5: point to boost explicitly to avoid /usr/local/ in the library path.
>     Discovered thanks to BR_COMPILER_PARANOID_UNSAFE_PATH, thank you
>     for that!
> ---
>  package/Config.in            |  1 +
>  package/cc-tool/Config.in    | 20 ++++++++++++++++++++
>  package/cc-tool/cc-tool.hash |  3 +++
>  package/cc-tool/cc-tool.mk   | 17 +++++++++++++++++
>  4 files changed, 41 insertions(+)
>  create mode 100644 package/cc-tool/Config.in
>  create mode 100644 package/cc-tool/cc-tool.hash
>  create mode 100644 package/cc-tool/cc-tool.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
