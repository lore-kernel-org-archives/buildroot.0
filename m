From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 21:50:02 +0200
Subject: [Buildroot] [PATCH 1/1] libnss: fix build without int128
In-Reply-To: <20180604170926.372-1-fontaine.fabrice@gmail.com>
References: <20180604170926.372-1-fontaine.fabrice@gmail.com>
Message-ID: <20180604215002.7ce9094c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jun 2018 19:09:26 +0200, Fabrice Fontaine wrote:
> Patch retrieved from upstream, more info here:
> https://bugzilla.mozilla.org/show_bug.cgi?format=default&id=1459739
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/093113829d7ce19d578a920e76caa10822774139
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...r-c-when-not-building-with-int128-support.patch | 143 +++++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 package/libnss/0003-Bug-1432455-Build-FStar-c-when-not-building-with-int128-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
