From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 08:35:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/mutt: fix CVE-2020-14093
In-Reply-To: <20200619221150.284997-1-fontaine.fabrice@gmail.com>
References: <20200619221150.284997-1-fontaine.fabrice@gmail.com>
Message-ID: <20200620083502.0fa8a098@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Jun 2020 00:11:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Mutt before 1.14.3 allows an IMAP fcc/postpone man-in-the-middle attack
> via a PREAUTH response.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...sible-IMAP-MITM-via-PREAUTH-response.patch | 60 +++++++++++++++++++
>  package/mutt/mutt.mk                          |  3 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 package/mutt/0003-Prevent-possible-IMAP-MITM-via-PREAUTH-response.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
