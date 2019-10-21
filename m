From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 20:46:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-secretstorage: drop
 Python 2 support
In-Reply-To: <20191020151126.2468-2-asafka7@gmail.com>
References: <20191020151126.2468-1-asafka7@gmail.com>
 <20191020151126.2468-2-asafka7@gmail.com>
Message-ID: <20191021204633.4b99b883@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 18:11:26 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Since version 3.0.0, secretstorage doesn't support Python 2 anymore.
> Update its reverese dependency (python-keyring) as well.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-keyring/Config.in       | 1 +
>  package/python-secretstorage/Config.in | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
