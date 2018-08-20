From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:51:59 +0200
Subject: [Buildroot] [[PATCH v2 04/14] package/mender: create directory
 containing Mender state script
In-Reply-To: <20180820130914.22377-5-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-5-mirza.krak@northern.tech>
Message-ID: <20180820165159.26e7eec9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 15:09:04 +0200, Mirza Krak wrote:
> Mender state-scripts are essentially "hooks" that can be provided to
> influence the update flow.
> 
> They should be placed inside /etc/mender/scripts and the directory must
> contain a file containing the current state-script format version. It is
> currently "2".
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>  package/mender/mender.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
