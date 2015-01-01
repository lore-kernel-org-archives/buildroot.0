From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:57:51 +0100
Subject: [Buildroot] [PATCHv1.0] szip: new package
In-Reply-To: <1420144680-28163-1-git-send-email-ernesto@slac.stanford.edu>
References: <1420144680-28163-1-git-send-email-ernesto@slac.stanford.edu>
Message-ID: <20150101225751.2d487bc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ernesto L. Williams Jr,

On Thu,  1 Jan 2015 12:38:00 -0800, Ernesto L. Williams Jr wrote:
> Signed-off-by: Ernesto L. Williams Jr <ernesto@slac.stanford.edu>
> ---
>  package/Config.in      |  1 +
>  package/szip/Config.in | 15 +++++++++++++++
>  package/szip/szip.mk   | 14 ++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/szip/Config.in
>  create mode 100644 package/szip/szip.mk

Thanks, applied, with only minor changes:

[Thomas:
  - Add hash file.
  - Rewrap Config.in help text and remove trailing whitespace.
  - Remove unneeded empty new line at the end of the .mk file.]

See the final commit at
http://git.buildroot.net/buildroot/commit/?id=1efb5ad43dec5539e2fa1c9bc0c4b2fecfdcfa32.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
