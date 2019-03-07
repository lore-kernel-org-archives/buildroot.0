From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 22:12:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/wireshark: security bump to
 version 2.6.7
In-Reply-To: <20190305210546.9200-2-fontaine.fabrice@gmail.com>
References: <20190305210546.9200-1-fontaine.fabrice@gmail.com>
 <20190305210546.9200-2-fontaine.fabrice@gmail.com>
Message-ID: <20190307221259.73e629fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Mar 2019 22:05:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes CVE-2019-9208, CVE-2019-9209 and CVE-2019-9214
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wireshark/wireshark.hash | 4 ++--
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
