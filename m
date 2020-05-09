From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 16:30:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix build with lua
In-Reply-To: <20200507171242.141886-1-fontaine.fabrice@gmail.com>
References: <20200507171242.141886-1-fontaine.fabrice@gmail.com>
Message-ID: <20200509163013.654d5534@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 May 2020 19:12:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.net/results/11bc7f4e1c54f074dd10a995233bee45c293e488
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...re.ac-fix-cross-compilation-with-lua.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/suricata/0002-configure.ac-fix-cross-compilation-with-lua.patch

Applied to master, thanks. Please submit upstream, the project uses
Github and seems to accept pull requests.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
