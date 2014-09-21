From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:44:26 +0200
Subject: [Buildroot] [PATCH v2 3/5] python-rtslib-fb: new package
In-Reply-To: <1411034455-19670-4-git-send-email-cvubrugier@fastmail.fm>
References: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
 <1411034455-19670-4-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20140921194426.63c05c4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Thu, 18 Sep 2014 12:00:53 +0200, Christophe Vu-Brugier wrote:
> rtslib-fb is an object-based Python library for configuring the
> LIO generic SCSI target, present in 3.x Linux kernel versions.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes v1 -> v2:
>  - rename python-rtslib.mk to python-rtslib-fb.mk (as suggested by Jerzy)
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/Config.in                            |  1 +
>  package/python-rtslib-fb/Config.in           |  9 +++++++++
>  package/python-rtslib-fb/python-rtslib-fb.mk | 13 +++++++++++++
>  3 files changed, 23 insertions(+)
>  create mode 100644 package/python-rtslib-fb/Config.in
>  create mode 100644 package/python-rtslib-fb/python-rtslib-fb.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
