From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 15:56:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: fix build with boost
 1.70.0
In-Reply-To: <20190418133848.15020-1-fontaine.fabrice@gmail.com>
References: <20190418133848.15020-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420155610.607ea53e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 15:38:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/4109881eab99fd720e97f1070c374e67dd881b85
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ..._impl.cc-fix-build-with-boost-1.70.0.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
