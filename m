From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:11:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-pybind: rename
 package to python-pybind11
In-Reply-To: <20200618134017.18704-1-guillaume.bressaix@gmail.com>
References: <20200618134017.18704-1-guillaume.bressaix@gmail.com>
Message-ID: <20200618211142.3720a766@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Jun 2020 15:40:17 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Renaming this package because the current name
> might be misleading in the future
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

I still don't get how "misleading in the future" is a good
justification.

> Please note that this package only allows C++->python
> bindings at the moment, Asaf's related work must be
> merged for python->c++ bindings

I also don't understand why this note makes sense here. If the current
package is limited, its Config.in help text should be improved to
document those limitations.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
