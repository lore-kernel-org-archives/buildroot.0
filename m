From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:36:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-uvloop: force
 re-cythonize on build
In-Reply-To: <20191025185448.32633-3-asafka7@gmail.com>
References: <20191025185448.32633-1-asafka7@gmail.com>
 <20191025185448.32633-3-asafka7@gmail.com>
Message-ID: <20191026153632.122e4a9d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 21:54:45 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> +define PYTHON_UVLOOP_HOOK

This hook name was not so good, so I changed to a more descriptive one.
I've also added a comment in the .mk file about the fact that this
stuff can be removed at the next uvloop version bump. Applied with
those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
