From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 21:54:55 +0100
Subject: [Buildroot] [PATCH 2/3] board/boundarydevices: update boot
 scripts
In-Reply-To: <20200326144436.529906-3-gary.bisson@boundarydevices.com>
References: <20200326144436.529906-1-gary.bisson@boundarydevices.com>
 <20200326144436.529906-3-gary.bisson@boundarydevices.com>
Message-ID: <20200326215455.0f65ceab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Mar 2020 15:44:35 +0100
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> - Add support for 8MMini and 8MNano
> - Upgrade script now resets by default
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  board/boundarydevices/common/boot.cmd    | 24 +++++++++++++++---------
>  board/boundarydevices/common/upgrade.cmd | 20 +++++++++++++++-----
>  2 files changed, 30 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
