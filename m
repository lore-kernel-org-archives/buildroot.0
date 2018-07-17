From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:32:30 +0200
Subject: [Buildroot] [PATCH 1/1] docker-containerd: add missing binary
 symlink
In-Reply-To: <CAGDkrv6D9avg7ps9j3PfBEwYNL-vNTQe2v-782A8u30Y6zB_fw@mail.gmail.com>
 (Sam Lancia's message of "Thu, 7 Jun 2018 08:51:07 +0100")
References: <CAGDkrv6D9avg7ps9j3PfBEwYNL-vNTQe2v-782A8u30Y6zB_fw@mail.gmail.com>
Message-ID: <878t6al3ld.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sam" == Sam Lancia <sam@gpsm.co.uk> writes:

 > In 2dccb4f2fefd8a0dbda65dd0f7537f811e920b13,
 > "/usr/bin/docker-containerd" was removed without replacing it with a
 > symlink

 > https://bugs.busybox.net/show_bug.cgi?id=11076

 > Signed-off-by: Sam Lancia <sam@gpsm.co.uk>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
