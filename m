From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 17:44:18 +0100
Subject: [Buildroot] [PATCH 1/1] scanpypi: write _SOURCE only when needed
In-Reply-To: <20181222181532.25326-1-asafka7@gmail.com>
References: <20181222181532.25326-1-asafka7@gmail.com>
Message-ID: <20181230174418.05a0fe81@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Dec 2018 20:15:32 +0200, Asaf Kahlon wrote:
> For some packages, there's no need to add the _SOURCE variable,
> since the name of the source file is the same as the name of the package
> (like python-engineio).
> Hence, we'll add it to the .mk file only if needed.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  utils/scanpypi | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
