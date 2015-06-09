From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:45:22 +0200
Subject: [Buildroot] [PATCH v5 01/13] package/opencv: cleanup spaces at
 ends of line
In-Reply-To: <1433672799-21387-2-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150609224522.6d6ff94d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  7 Jun 2015 12:26:27 +0200, Samuel Martin wrote:
> Nothing more than removing white spaces before '\' characters.
> Of course, 'git diff -w' shows no change at all.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v4->v5:
> - new patch
> ---
>  package/opencv/opencv.mk | 112 +++++++++++++++++++++++------------------------
>  1 file changed, 56 insertions(+), 56 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
