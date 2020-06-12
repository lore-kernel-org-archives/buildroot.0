From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 12 Jun 2020 07:31:07 +0200
Subject: [Buildroot] [PATCH 0/3] allow to recompile wireless-regdb
Message-ID: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds an option to recompile wireless-regdb.
This became necessary in our product for outdoor use.
In some countries, different regulations apply for indoor
and outdoor use. The precompiled version of wireless-regdb
is appropriate for indoor use only.

For this to work, we compile using python3, and added
host-python3-m2crypto prerequisite in buildroot.

Finally, we patched wireless-regdb for hiding the username
of the build-server.

Kind regards,
Kurt
