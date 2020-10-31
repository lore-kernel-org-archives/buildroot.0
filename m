From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:04:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/fastd: fix CVE-2020-27638
In-Reply-To: <20201031163420.289481-1-fontaine.fabrice@gmail.com>
References: <20201031163420.289481-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031220413.2d29f1cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Oct 2020 17:34:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> receive.c in fastd before v21 allows denial of service (assertion
> failure) when receiving packets with an invalid type code.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-leak-when-receiving-invalid-packets.patch | 45 +++++++++++++++++++
>  package/fastd/fastd.mk                        |  3 ++
>  2 files changed, 48 insertions(+)
>  create mode 100644 package/fastd/0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
