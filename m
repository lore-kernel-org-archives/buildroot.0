From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Nov 2010 14:50:24 +0100
Subject: [Buildroot] [PATCH 1/2] Create X symlink for TinyX
In-Reply-To: <20101104085833.30286.42896.stgit@localhost.localdomain>
References: <20101104085833.30286.42896.stgit@localhost.localdomain>
Message-ID: <20101104145024.11368812@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 04 Nov 2010 10:58:33 +0200
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> When installing TinyX to target create /usr/bin/X symlink
> to Xfbdev as it is the only TinyX driver we build.
> This makes utils like startx happy :)
> 
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
