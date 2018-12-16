From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:29:06 +0100
Subject: [Buildroot] [PATCH] package/libgpgme: properly tweak
 gpgme-config
In-Reply-To: <20181211152425.32525-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 11 Dec 2018 16:24:25 +0100")
References: <20181211152425.32525-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lg4p5ffh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > libgpgme installs a gpgme-config script, it should be tweaked using
 > the <pkg>_CONFIG_SCRIPTS mechanism. This is generally useful and is
 > going to be particularly important with per-package directories.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
