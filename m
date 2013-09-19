From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 17:40:42 +0200
Subject: [Buildroot] [PATCH 4 of 4] manual generation: rename manual-txt
 into manual-text
In-Reply-To: <a2b05987569c1439422b.1379587636@argentina>
References: <patchbomb.1379587632@argentina>
 <a2b05987569c1439422b.1379587636@argentina>
Message-ID: <20130919174042.541b6c51@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 19 Sep 2013 12:47:16 +0200, Thomas De Schampheleire wrote:
> The output extension and the generation messages refer to 'text', but the make
> target was confusingly 'txt'. This patch changes the make target for
> consistency.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

That's a change in the Buildroot interface, but I believe it's ok.
However, you're not updating another occurrence of manual-txt in the
main Makefile (see the release target).

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
