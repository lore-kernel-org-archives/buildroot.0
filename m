From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 11:28:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/pistache: link with libatomic
 when needed
In-Reply-To: <20200815201415.3723205-1-fontaine.fabrice@gmail.com>
References: <20200815201415.3723205-1-fontaine.fabrice@gmail.com>
Message-ID: <20200816112826.4621df4f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Aug 2020 22:14:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pistache does not mandatory link with libatomic since
> https://github.com/oktal/pistache/commit/4ed3f8e148dae203730139ae3c1c4c87bfc86c02
> however the logic is broken due to an unknown issue in CheckAtomic.cmake.

It's a bit sad that they have all this logic to detect if linking with
libatomic is needed, and it doesn't work for us. Have you investigated
a bit more why it is not working ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
