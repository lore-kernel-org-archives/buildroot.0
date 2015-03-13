From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 23:15:49 +0100
Subject: [Buildroot] [PATCH] boost: enable boost-atomic
In-Reply-To: <1426153464-31580-1-git-send-email-nrubinstein@aldebaran.com>
References: <1426153464-31580-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20150313231549.15a2cd9a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear No? Rubinstein,

On Thu, 12 Mar 2015 10:44:24 +0100, No? Rubinstein wrote:
> It was disabled in february 2013 by commit
> e5434583badf1abf4a4620efa76452638ad9e177
> because did not build correctly with ucLibc at the time.
> 
> It now builds correctly with both uClibc v0.9.33 and uClibc-ng.
> 
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> ---
>  package/boost/Config.in | 3 +++
>  package/boost/boost.mk  | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
