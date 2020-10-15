From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 20:14:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libapparmor: fix build on musl
In-Reply-To: <20201015162413.916731-1-fontaine.fabrice@gmail.com>
References: <20201015162413.916731-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015201453.1d5acde3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 18:24:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of version 3.0.0 with musl
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/22fb440240aa698acc68f026be790d5366c8f908
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...or-add-missing-include-for-socklen_t.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/libapparmor/0001-libapparmor-add-missing-include-for-socklen_t.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
