From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 22:56:06 +0200
Subject: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
In-Reply-To: <20180702123820.32222-1-david.degrave@mind.be>
References: <20180702123820.32222-1-david.degrave@mind.be>
Message-ID: <20180702225606.6a254d38@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Jul 2018 14:38:20 +0200, David De Grave (Essensium/Mind)
wrote:
> Add the i686 package list to install when using pre-built 32 bits binaries with
> a redhat/fedora host distribution (glibc.i686 and zlib.i686).
> 
> Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>

Thanks, but why your title was cut ? It needs to have the following
format:

	<prefix>: <description>

> Remark: The 32 bits libraries are already included in the gcc package contrary

"libraries" no, but multilib compiler yes.

Patch applied after fixing the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
