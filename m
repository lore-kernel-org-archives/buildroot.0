From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 17 Oct 2014 16:00:02 +0200
Subject: [Buildroot] [PATCH] pkg-stats: add statistics about hash files
In-Reply-To: <1413552852-28279-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413552852-28279-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAGduivyR-_L6GZE2RpQ7M=EqQdiV8UnjnDaR26XimdHoJs0JrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Fri, Oct 17, 2014 at 3:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> As discussed during the Buildroot meeting, this commit extends the
> pkg-stats script to include statistics about the number of packages
> having vs. not having the hash file.
>
> As of today, we have 104 packages with the hash file, and 1274
> packages without.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
As information, I have started reworking this patch:
http://patchwork.ozlabs.org/patch/337267/
I'll make sure to take your current patch into account.
