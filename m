From: Michael Roth <mroth@nessie.de>
Date: Wed, 30 Sep 2009 10:37:47 +0200
Subject: [Buildroot] [PATCH v2] Fix download directory in default configs
In-Reply-To: <1253888634-7899-1-git-send-email-mroth@nessie.de>
References: <1253888634-7899-1-git-send-email-mroth@nessie.de>
Message-ID: <200909301037.53419.mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Friday 25 September 2009 16:23:54 schrieb Michael Roth:
> Commit a07d6b9d56955bfe0165b5f4ea6d3ed7a92ecff6 changed the meaning
> of $(BASE_DIR). Previously it was the top level buildroot directory,
> now it is the 'output' directory.
> As an side effect, the download directory 'dl' was moved to 'output/dl'.
>
> In commit 416323e93442646e344a4e914776520c5e552fa0 the default download
> directory was moved back to the top level of buildroot.
>
> So the various default configurations should reflect this. Fix them.

Ping...

IMHO this should be applied to buildroot or I'm missing something?
