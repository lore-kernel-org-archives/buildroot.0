From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 16:34:51 +0200
Subject: [Buildroot] [PATCH v6] leveldb: new package
In-Reply-To: <1421146437-17829-1-git-send-email-ste@junkomatic.net>
References: <1421146437-17829-1-git-send-email-ste@junkomatic.net>
Message-ID: <20150405163451.31dbe84d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve James,

On Tue, 13 Jan 2015 10:53:57 +0000, Steve James wrote:
> Signed-off-by: Steve James <ste@junkomatic.net>

Applied, thanks, after doing some small changes:

    [Thomas:
      - remove 003-allow-flags-from-environment.patch, and pass
        TARGET_CONFIGURE_OPTS in the environment instead.
      - convert the patches to Git formatted patches.
      - use the v1.18 tag instead of a commit hash.
      - do not pass TARGET_CONFIGURE_OPTS at install time, this is not
        needed.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
