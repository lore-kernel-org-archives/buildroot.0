From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:16:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: bump to version 4.16.0
In-Reply-To: <20200422164413.518719-1-fontaine.fabrice@gmail.com>
References: <20200422164413.518719-1-fontaine.fabrice@gmail.com>
Message-ID: <20200423221605.7de30732@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Apr 2020 18:44:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add patch to fix build
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...fuzz-Makefile.am-do-not-force-static.patch | 35 +++++++++++++++++++
>  package/libtasn1/libtasn1.hash                | 10 +++---
>  package/libtasn1/libtasn1.mk                  |  2 +-
>  3 files changed, 41 insertions(+), 6 deletions(-)
>  create mode 100644 package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
