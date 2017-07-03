From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 18:04:35 +0200
Subject: [Buildroot] [PATCH 4/5] core/pkg-utils: check hashes of license
	files
In-Reply-To: <b4adb01dc51cc7e3300265e0b97e0366f7fbb786.1498428166.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 26 Jun 2017 00:03:40 +0200")
References: <cover.1498428166.git.yann.morin.1998@free.fr>
 <b4adb01dc51cc7e3300265e0b97e0366f7fbb786.1498428166.git.yann.morin.1998@free.fr>
Message-ID: <87fued7bho.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This will help catch a change of license even if the filename does
 > not change.

 > For now, a missing hash for the license files is not a fatal error, to
 > let people catch up and add them. When we switch to make it mandatory,
 > we can simplify the code by just removing the case statement.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
