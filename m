From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 23:24:32 +0100
Subject: [Buildroot] [PATCH 1/5] utils/genrandconfig: filter empty lines
 and comments in CSV file
In-Reply-To: <20171029171440.8095-2-thomas.petazzoni@free-electrons.com>
References: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
 <20171029171440.8095-2-thomas.petazzoni@free-electrons.com>
Message-ID: <20171127232432.37d3b7f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 18:14:36 +0100, Thomas Petazzoni wrote:
> In preparation for the addition of comments in the CSV file listing
> toolchain configurations, we filter out such lines when reading the
> CSV file in utils/genrandconfig.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  utils/genrandconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to next after dropping the spurious change noticed by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
