From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 21:43:40 +0100
Subject: [Buildroot] [PATCH 4/4] Make savedefconfig save to a configured
	file.
In-Reply-To: <41e27bc2d2881606d1da299f6056d24bc9d34e78.1360084128.git.arnout@mind.be>
 (Arnout Vandecappelle's message of "Tue, 5 Feb 2013 18:16:02 +0100")
References: <cover.1360084128.git.arnout@mind.be>
 <cover.1360084128.git.arnout@mind.be>
 <41e27bc2d2881606d1da299f6056d24bc9d34e78.1360084128.git.arnout@mind.be>
Message-ID: <87vca6o5j7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Store BR2_DEFCONFIG in .config, and use it to update the
 Arnout> original input defconfig file after updating the configuration.
 Arnout> When a config is created by using the BR2_DEFCONFIG=... option,
 Arnout> this is saved in the .config file; later runs of savedefconfig
 Arnout> will update that same location.

Committed with a minor fix (see below) - Thanks.
 Arnout> +called +defconfig+.  If you want to save it in another place, update set

s/update set/change/

-- 
Bye, Peter Korsgaard
