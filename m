From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 14:55:22 +0100
Subject: [Buildroot] [PATCH] docs/manual: centralize recommendations
	about BR2_DL_DIR
In-Reply-To: <1486418373-26759-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Mon, 6 Feb 2017 22:59:33 +0100")
References: <1486418373-26759-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87fujqrtpx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > We currently have two places where we recommend where BR2_DL_DIR
 > should be set: "Environment variables" and "Location of downloaded
 > packages". The former recommends setting BR2_DL_DIR in the .config,
 > the latter kind of endorses using ~/.bashrc.

 > We prefer suggesting the ~/.bashrc way since it avoids downloading the
 > same file multiple times, and anyway ot's wise to have all the details
 > in a unique place. So remove the .config suggestion from "Environment
 > variables" and let it just point to "Location of downloaded packages".

 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
