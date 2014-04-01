From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Apr 2014 14:45:49 +0200
Subject: [Buildroot] [PATCHv2] libcurl: security bump to version 7.36.0
In-Reply-To: <1396305298-4798-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396305298-4798-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140401144549.1e978c2b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 31 Mar 2014 19:34:58 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2014-0005, CVE-2014-0319, CVE-2014-1263 and CVE-2014-2522.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libcurl/libcurl-01-disable-manual.patch | 31 +++++++++++++++++++++++++
>  package/libcurl/libcurl.mk                      |  2 +-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 package/libcurl/libcurl-01-disable-manual.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
