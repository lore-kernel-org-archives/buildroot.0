From: Davide Viti <zinosat@tiscali.it>
Date: Tue, 18 Mar 2014 16:48:26 +0100
Subject: [Buildroot] [PATCH] eigen: (optionally) install unsupported modules
Message-ID: <1395157707-23939-1-git-send-email-d.viti@infosolution.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm working on a package which depends on some include files residing
in the "unsupported" folder. The following patch makes it possible to
include the "unsupported" folder in the staging dir.

regards,
Davide
