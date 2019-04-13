From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 15:43:55 +0200
Subject: [Buildroot] [PATCH v4 1/3] .gitlab-ci.yml: reorder jobs
In-Reply-To: <20190408032255.12841-2-ricardo.martincoski@gmail.com>
References: <20190408032255.12841-1-ricardo.martincoski@gmail.com>
 <20190408032255.12841-2-ricardo.martincoski@gmail.com>
Message-ID: <d73aa99a-f500-2c5e-7335-6db12e429f23@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/04/2019 05:22, Ricardo Martincoski wrote:
> In order to make the file easier to maintain, reorder the keys in a more
> logical way:
> Keep the docker image at the top.
> Then all check-* jobs in the case-insensitive alphabetical order they
> appear on Gitlab-CI pipeline results.
> Then all keys related to defconfigs.
> Finally all keys related to runtime tests.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


 Applied to master, thanks.

 I tested it by just saving the output of `sort .gitlab-ci.yml.in` before and
after and checking that they were equal.

 Regards,
 Arnout
