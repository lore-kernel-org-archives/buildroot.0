From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 23:12:49 +0100
Subject: [Buildroot] [PATCH] package/libassuan: fixup libassuan-config
In-Reply-To: <20181116135242.27171-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 16 Nov 2018 14:52:42 +0100")
References: <20181116135242.27171-1-thomas.petazzoni@bootlin.com>
Message-ID: <87o9aor7ry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The libassuan library installs libassuan-config, but it is not
 > currently fixed up by our <pkg>_CONFIG_SCRIPTS logic. While this
 > doesn't cause any problem today, it fails badly with per-package
 > folders, so let's use <pkg>_CONFIG_SCRIPTS.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
