From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:14:18 +0100
Subject: [Buildroot] [PATCH] poppler: security bump to version 0.24.5
In-Reply-To: <1420547402-17213-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420547402-17213-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150106211418.4ca3ea63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  6 Jan 2015 09:30:02 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2013-7296 - JBIG2Stream::readSegments()" Denial of Service
> Vulnerability.
> 
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/poppler/poppler.hash | 2 ++
>  package/poppler/poppler.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/poppler/poppler.hash

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
