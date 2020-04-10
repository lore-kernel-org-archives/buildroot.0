From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:04:18 +0200
Subject: [Buildroot] [PATCH buildroot-test] utils/daily-mail: implement
 CVE notification
In-Reply-To: <20200218025002.111059-1-thomas.petazzoni@bootlin.com>
References: <20200218025002.111059-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200410220418.0ea274eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 03:50:02 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit improves the daily-mail script so that it uses the
> recently added CVE information in the JSON output of pkg-stats to send
> CVE-related notifications to the Buildroot mailing list and to
> individual maintainers of Buildroot packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  utils/daily-mail | 65 +++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 59 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
