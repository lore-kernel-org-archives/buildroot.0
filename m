From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:40:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version
 5.1.0
In-Reply-To: <20200413235333.64869-1-james.hilliard1@gmail.com>
References: <20200413235333.64869-1-james.hilliard1@gmail.com>
Message-ID: <20200415214004.6d68795b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Apr 2020 17:53:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add missing host-python-setuptools-scm dependency.

This new dependency is unrelated to the 5.1.0: it was already needed
for the current 5.0.1. In such cases, we want to have separate patches:
one to fix the package as it is today, and one the version bump.

So I've applied Asaf's patch to fix the missing dependency, and then
reworked your version bump on top of it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
