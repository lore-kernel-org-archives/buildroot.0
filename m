From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 21:54:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-keyring: bump to version
 19.2.0
In-Reply-To: <20191021134031.20586-11-asafka7@gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
 <20191021134031.20586-11-asafka7@gmail.com>
Message-ID: <20200413215455.138df2b0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 16:40:31 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> * Update dependency list.
> * The package doesn't support Python 2 anymore.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-keyring/Config.in           | 2 ++
>  package/python-keyring/python-keyring.hash | 7 ++++---
>  package/python-keyring/python-keyring.mk   | 4 ++--
>  3 files changed, 8 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
