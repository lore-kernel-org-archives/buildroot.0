From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:10:18 +0100
Subject: [Buildroot] [PATCH] package/asterisk: fix parallel install
In-Reply-To: <20171201101805.8226-1-yann.morin.1998@free.fr>
References: <20171201101805.8226-1-yann.morin.1998@free.fr>
Message-ID: <20171201221018.259bcdfd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 11:18:05 +0100, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/7c92fb71d0aee211c8e0ef9d646da477fd97fb4c/
>     http://autobuild.buildroot.org/results/2b8c810bd8775413fd4567b2f8495be70b7bb808/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../0006-install-samples-need-the-data-files.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/asterisk/0006-install-samples-need-the-data-files.patch

Applied to master, thanks! Please don't forget to submit upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
