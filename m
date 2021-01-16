From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:34:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/open62541: fix build without
 threads
In-Reply-To: <20210110133026.822203-1-fontaine.fabrice@gmail.com>
References: <20210110133026.822203-1-fontaine.fabrice@gmail.com>
Message-ID: <20210116223424.221795bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Jan 2021 14:30:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/87ec3c987c991f790757276316d6caf81e635fa2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...eLists.txt-fix-build-without-threads.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch

Applied to master, thanks. Could you submit upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
