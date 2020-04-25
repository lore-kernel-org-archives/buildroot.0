From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:46:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/libcpprestsdk: zlib is optional,
 not mandatory
In-Reply-To: <20200314222027.2317520-1-fontaine.fabrice@gmail.com>
References: <20200314222027.2317520-1-fontaine.fabrice@gmail.com>
Message-ID: <20200425154605.193cac00@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Mar 2020 23:20:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcpprestsdk/Config.in        | 1 -
>  package/libcpprestsdk/libcpprestsdk.mk | 9 ++++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
