From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 11:34:33 +0200
Subject: [Buildroot] [PATCH] package/pugixml: Fix CMakelists.txt
 cxx_long_long_type bug.
In-Reply-To: <1473668083-362-1-git-send-email-theo.debrouwere@skynet.be>
References: <20160912091925.36c6f94d@free-electrons.com>
 <1473668083-362-1-git-send-email-theo.debrouwere@skynet.be>
Message-ID: <20160912113433.17bdd15a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 10:14:43 +0200, Theo Debrouwere wrote:
> CMakelist.txt tries to enable the cxx_long_long_type option,
> even if the feature isn't available. (Which causes some builds to fail)
> 
> The included patch checks if the option is present before applying it.
> 
> The patch was backported from:
> https://github.com/zeux/pugixml/commit/4dbb5646196a4a3cc94097f1473ef11d1d44df11
> 
> Signed-off-by: Theo Debrouwere <t.debrouwere@televic.com>
> ---
>  .../0001-check-cxx_long_long_type-existence.patch  | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/pugixml/0001-check-cxx_long_long_type-existence.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
