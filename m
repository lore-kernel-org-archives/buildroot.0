From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 22:47:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pip: add host-python-pip
 possibility
In-Reply-To: <20200609121702.19880-1-guillaume.bressaix@gmail.com>
References: <20200609121702.19880-1-guillaume.bressaix@gmail.com>
Message-ID: <20200610224729.106a4b75@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Jun 2020 14:17:02 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> My next contribution requires host-python-pip
> because 'import pip' is required in its setup.py
> and so, must be present at build time.
> 
> This is a just a new option, compatible
> with previous packages. Call it with
> with 'PYTHON_FOO_DEPENCIES = host-python-pip'
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Could you preferably send this together with your next contribution, as
a patch series ? This way, we'll see how it fits with the rest of your
contribution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
