From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 14:37:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/davfs2: add davfs user and group
In-Reply-To: <20201105131149.1124173-1-mail@klomp.eu>
References: <20201105131149.1124173-1-mail@klomp.eu>
Message-ID: <20201107143717.349a1144@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Nov 2020 14:11:49 +0100
Sven Klomp <mail@klomp.eu> wrote:

> mount.davfs expects the availability of the user and group davfs.

"of the user and group davfs2" since that's the ones you're adding.

Applied to master with the commit log updated. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
