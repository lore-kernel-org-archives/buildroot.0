From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:01:58 +0200
Subject: [Buildroot] [PATCH] xerces: security bump to version 3.1.4
In-Reply-To: <1467309175-9267-1-git-send-email-gustavo@zacarias.com.ar>
References: <1467309175-9267-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160701000158.7914f8fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Jun 2016 14:52:55 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-4463 - XML Parser Crashes on Malformed DTD.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/xerces/xerces.hash | 4 ++--
>  package/xerces/xerces.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
