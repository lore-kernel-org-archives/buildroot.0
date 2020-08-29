From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:57:53 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lftp: bump to version 4.9.2
In-Reply-To: <20200829204110.2884537-1-fontaine.fabrice@gmail.com>
References: <20200829204110.2884537-1-fontaine.fabrice@gmail.com>
Message-ID: <20200829225753.2bc2bc92@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:41:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update indentation in hash file (two spaces)
> 
> Extract from NEWS:
> 
> - mkdir: fixed exit code with -f option.
> - ftp: made ftp:use-pret setting tri-boolean.
> - get/mget/put/mput: don't try next files after error if cmd:fail-exit
>   is true.
> - get/mget: fixed -O option with remote URL and xfer:use-temp-file being
>   true.
> - mirror: disallow empty patterns; don't delete "..".
> - mirror: fixed --on-change with --reverse.
> - sftp: fixed a bug with truncated files when packets are reordered
>   (finally).
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lftp/lftp.hash | 8 ++++----
>  package/lftp/lftp.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
