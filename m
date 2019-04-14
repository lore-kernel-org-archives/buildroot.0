From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 14:46:04 +0200
Subject: [Buildroot] [PATCH 1/2] package/stunnel: fix static build with
 openssl and atomic
In-Reply-To: <20190411211250.9402-1-fontaine.fabrice@gmail.com>
References: <20190411211250.9402-1-fontaine.fabrice@gmail.com>
Message-ID: <20190414144604.2906deab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Apr 2019 23:12:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use pkg-config to find openssl dependencies such as lz or latomic
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/28a466b98f813edb6402686cc4706766e73e1ff3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/stunnel/stunnel.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
