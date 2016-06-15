From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:12:15 +0200
Subject: [Buildroot] [PATCH 1/3] imagemagick: bump to version 7.0.2-0
In-Reply-To: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160615231215.491582b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Jun 2016 09:34:21 -0300, Gustavo Zacarias wrote:
> Add new disables for libraries that aren't supported in buildroot and
> sort them for ease of maintenance.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/imagemagick/imagemagick.hash |  2 +-
>  package/imagemagick/imagemagick.mk   | 21 ++++++++++++---------
>  2 files changed, 13 insertions(+), 10 deletions(-)

Entire series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
