From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:28:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/vsftpd: set VSFTPD_CPE_ID_VALID
In-Reply-To: <20210130135154.2368987-1-fontaine.fabrice@gmail.com>
References: <20210130135154.2368987-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131212838.66b90664@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2021 14:51:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:vsftpd_project:vsftpd is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avsftpd_project%3Avsftpd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vsftpd/vsftpd.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
