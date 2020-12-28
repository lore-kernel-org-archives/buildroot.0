From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:48:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix build with glibc
 2.32
In-Reply-To: <20201226113638.1174165-1-fontaine.fabrice@gmail.com>
References: <20201226113638.1174165-1-fontaine.fabrice@gmail.com>
Message-ID: <20201228224830.5719716f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Dec 2020 12:36:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/2ceef1b861fe952b2c053da70540bd830014bf7a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-function-conflicts-with-glibc-nss-h.patch | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 package/samba4/0005-nsswitch-nsstest-c-Avoid-nss-function-conflicts-with-glibc-nss-h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
