From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 17:16:15 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: bumped version number to 5.25
In-Reply-To: <546F6FCB.1090101@imgtec.com>
References: <1416587791-30125-1-git-send-email-jaap@jcz.nl>
 <546F6FCB.1090101@imgtec.com>
Message-ID: <20141122171615.7eb18494@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 21 Nov 2014 17:00:59 +0000, Vicente Olivert Riera wrote:

> Another one. When you create the patch using "git format-patch", before
> sending it, please edit the patch using your favourite text editor and
> add the version number in the "Subject" line. Here is an example using
> your own patch:
> 
> Subject: [PATCH v2] bluez5_utils: bumped version number to 5.25

Just a quick comment: there's no need to fire up a text editor to do
this. Just do:

	git format-patch --subject-prefix="PATCHv2"

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
