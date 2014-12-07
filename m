From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:50:43 +0100
Subject: [Buildroot] [PATCH 1/1] lighttpd: install fastcgi config for php
In-Reply-To: <1417559724-25091-1-git-send-email-bluemrp9@gmail.com>
References: <1417559724-25091-1-git-send-email-bluemrp9@gmail.com>
Message-ID: <20141207235043.01177f0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Coe,

On Tue,  2 Dec 2014 14:35:24 -0800, Ryan Coe wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/lighttpd/fastcgi.conf |  7 +++++++
>  package/lighttpd/lighttpd.mk  | 11 +++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/lighttpd/fastcgi.conf

Seeing the feedback from Floris Bos on this patch, I marked your patch
as 'Rejected' in our patch tracking system. Please work with Floris on
a variant of your patch that takes into account also his use case
(maybe by making the fastcgi installation optional?).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
