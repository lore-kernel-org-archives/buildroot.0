From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:11:30 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/cups-filters: fix build without dejavu font
In-Reply-To: <20200714143402.4164670-1-fontaine.fabrice@gmail.com>
References: <20200714143402.4164670-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714221130.6e519e6b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 16:34:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since version 1.27.3, cups-filters needs dejavu (even if it is only used
> for test programs):
> https://github.com/OpenPrinting/cups-filters/commit/1d66106e5ae45407b01459cb112ee09752166dba
> 
> Add a patch to avoid this build failure when cross-compiling and set
> test font path to /dev/null to avoid setting TESTFONT to an incorrect
> host path
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0e141abc57e4185c74adce75cac4215dd8a3108b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Set test font path to /dev/null
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Add a patch instead of adding dejavu dependency

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
