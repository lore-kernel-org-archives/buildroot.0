From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 14:57:55 +0200
Subject: [Buildroot] [PATCH 1/8] package/python-psutil: add host variant
In-Reply-To: <20200323104909.16765-1-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
Message-ID: <20200424145755.0e619237@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 11:49:02 +0100
yegorslists at googlemail.com wrote:

> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> host-python-psutil for host-python3 is needed for mongodb >= 4.1.8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/python-psutil/python-psutil.mk | 4 ++++
>  1 file changed, 4 insertions(+)

I have not applied, because this commit is essentially reverted by
PATCH 7/8 in this series
(http://patchwork.ozlabs.org/project/buildroot/patch/20200323104909.16765-7-yegorslists at googlemail.com/),
leaving the host-python-psutil package unused. So I've marked as Rejected.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
