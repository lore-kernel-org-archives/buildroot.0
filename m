From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 21:51:09 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/python-mbstrdecoder: needs python3
In-Reply-To: <20200422162418.488244-1-fontaine.fabrice@gmail.com>
References: <20200422162418.488244-1-fontaine.fabrice@gmail.com>
Message-ID: <20200425215109.286d1bf9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Apr 2020 18:24:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python2 has been dropped since version 1.0.0 and
> https://github.com/thombashi/mbstrdecoder/commit/d8f6fd76452ef82d08d1633a0e484349fedc190b
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/324dc351752d412a315955faf69e8f5637e75123
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Baruch Siach):
>  - Drop unneeded selects due to python3 dependency

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
