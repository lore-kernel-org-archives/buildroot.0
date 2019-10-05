From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:14:57 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-websocket-client:
 bump to version 0.56.0
In-Reply-To: <20191005153147.5277-1-asafka7@gmail.com>
References: <20191005153147.5277-1-asafka7@gmail.com>
Message-ID: <20191005221457.665314ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Oct 2019 18:31:47 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> The license file has changed to BSD-3-Clause, but the source files
> still specify the LGPL-2.1+ license, so we'll have to specify both
> licenses for now.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
> v1->v2: Specify both licenses, and ammend the commit message accordingly.
> ---
>  .../python-websocket-client/python-websocket-client.hash | 9 +++++----
>  .../python-websocket-client/python-websocket-client.mk   | 6 +++---
>  2 files changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks. Could you please submit a bug report/issue
upstream about the inconsistency between the LICENSE file and the
actual source files ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
