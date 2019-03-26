From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Mar 2019 21:49:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ecryptfs-utils: Add support
 without gettext
In-Reply-To: <20190326192819.GL2660@scaer>
References: <20190315023456.15988-1-vadim4j@gmail.com>
 <20190326192819.GL2660@scaer>
Message-ID: <6be479f6-983d-e383-5038-437de745f0a8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/03/2019 20:28, Yann E. MORIN wrote:
> Also, it is usualy bad practice to generate such scripts from configure.
> Instead, they should be generated in Makefile.am as new targets. Yes,
> this is a bit more involved, but is much cleaner: when you change such a
> script, you just have to run 'make' again, rather than re-run configure.

 Is that really so? I thought automake would generate a rule that just re-runs
config.status when such a file changes. Haven't tested though.

 Regards,
 Arnout
