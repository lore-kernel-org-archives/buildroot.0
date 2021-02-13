From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 22:48:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.4.3
In-Reply-To: <20210212215724.380720-1-fontaine.fabrice@gmail.com>
References: <20210212215724.380720-1-fontaine.fabrice@gmail.com>
Message-ID: <20210213224820.39a5f329@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Feb 2021 22:57:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> The following vulnerabilities have been fixed:
>  - wnpa-sec-2021-01 USB HID dissector memory leak. Bug 17124.
>    CVE-2021-22173.
>  - wnpa-sec-2021-02 USB HID dissector crash. Bug 17165. CVE-2021-22174.
> 
> https://www.wireshark.org/docs/relnotes/wireshark-3.4.3.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
