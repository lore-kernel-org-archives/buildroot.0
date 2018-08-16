From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 22:09:36 +0200
Subject: [Buildroot] [PATCH 1/1] boost: put back chrono select for
 coroutine
In-Reply-To: <20180816183031.13304-1-fontaine.fabrice@gmail.com>
References: <20180816183031.13304-1-fontaine.fabrice@gmail.com>
Message-ID: <20180816220936.43eb6e7e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Aug 2018 20:30:31 +0200, Fabrice Fontaine wrote:
> coroutine module does use chrono directly:
> 
> ./libs/coroutine/performance/asymmetric/segmented/Jamfile.v2: <library>/boost/chrono//boost_chrono
> ./libs/coroutine/performance/asymmetric/Jamfile.v2: <library>/boost/chrono//boost_chrono
> ./libs/coroutine/performance/symmetric/segmented/Jamfile.v2: <library>/boost/chrono//boost_chrono
> ./libs/coroutine/performance/symmetric/Jamfile.v2: <library>/boost/chrono//boost_chrono
> 
> So put back select of chrono for coroutine
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
