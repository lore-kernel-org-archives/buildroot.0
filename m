From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:26:35 +0200
Subject: [Buildroot] [PATCH 1/1] utils/genrandomconfig: use randint
 instead of (undefined) randInt
In-Reply-To: <20191026142056.18213-1-asafka7@gmail.com>
References: <20191026142056.18213-1-asafka7@gmail.com>
Message-ID: <20191026162635.6f36c3c0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 17:20:56 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/333788455
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  utils/genrandconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Doh, I should really open my eyes better when reviewing and applying
patches it seems. Thanks for catching this and providing a fix!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
