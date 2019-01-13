From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:15:11 +0100
Subject: [Buildroot] [PATCH 1/1] python-pyyaml: security bump to 4.2b4
In-Reply-To: <20190112174227.6228-4-asafka7@gmail.com>
References: <20190112174227.6228-1-asafka7@gmail.com>
 <20190112174227.6228-4-asafka7@gmail.com>
Message-ID: <20190113141511.39aaa7c8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 19:42:27 +0200, Asaf Kahlon wrote:
> Fixes CVE-2017-18342: In PyYAML before 4.1, the yaml.load() API
> could execute arbitrary code.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pyyaml/python-pyyaml.hash | 4 ++--
>  package/python-pyyaml/python-pyyaml.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
