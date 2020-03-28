From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Mar 2020 14:59:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/libical: fix CVE-2016-9584
In-Reply-To: <20200328093647.959215-1-fontaine.fabrice@gmail.com>
References: <20200328093647.959215-1-fontaine.fabrice@gmail.com>
Message-ID: <20200328145909.1fabacbd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Mar 2020 10:36:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libical allows remote attackers to cause a denial of service
> (use-after-free) and possibly read heap memory via a crafted ics file.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ype_from_string-copy-the-reqstattype.patch | 27 +++++++++++++++++++
>  package/libical/libical.mk                    |  3 +++
>  2 files changed, 30 insertions(+)
>  create mode 100644 package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
