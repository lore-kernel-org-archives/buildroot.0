From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:05:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/tslib: fix build with headers <
 4.16
In-Reply-To: <20200323074828.44084-1-fontaine.fabrice@gmail.com>
References: <20200323074828.44084-1-fontaine.fabrice@gmail.com>
Message-ID: <20200324220556.7cae10cd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 08:48:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit fedaa28079489b308f77d80a0cac8698d776df23 fixed build with
> headers >= 4.16 but as a side effect, build with headers < 4.16 is now
> failing so add an upstream patch
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/594cd1a0d9e6286eca62b575fd1ba2d3a5e01234
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-with-input_event_sec-for-old-kernel.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/tslib/0002-Fix-build-error-with-input_event_sec-for-old-kernel.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
