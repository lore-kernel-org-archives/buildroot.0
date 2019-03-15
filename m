From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:37:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-nfc: bump to version
 0.13.5
In-Reply-To: <20190315154610.23409-1-fontaine.fabrice@gmail.com>
References: <20190315154610.23409-1-fontaine.fabrice@gmail.com>
Message-ID: <20190315213756.1f4a807d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Mar 2019 16:46:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to github
> - Add python-nfc.hash
> - Add license file and its hash
> - Remove patch (not needed anymore)
> - Switch to setuptools (instead of distutils)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-nfc/0001-add-setup-py.patch | 26 --------------------------
>  package/python-nfc/python-nfc.hash         |  3 +++
>  package/python-nfc/python-nfc.mk           |  8 ++++----
>  3 files changed, 7 insertions(+), 30 deletions(-)
>  delete mode 100644 package/python-nfc/0001-add-setup-py.patch
>  create mode 100644 package/python-nfc/python-nfc.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
