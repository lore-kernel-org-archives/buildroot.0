From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Nov 2019 11:40:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-sip: fix install with
 python 3.8
In-Reply-To: <20191101094108.22347-1-fontaine.fabrice@gmail.com>
References: <20191101094108.22347-1-fontaine.fabrice@gmail.com>
Message-ID: <20191101114004.3950660f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  1 Nov 2019 10:41:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Install python-sip in the correct directory otherwise build of
> python-pyqt5 will fail
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a471b33e8a9803dfe8b36e83647c98165873ddf1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-sip/python-sip.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
