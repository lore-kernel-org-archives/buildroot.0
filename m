From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Nov 2019 17:35:30 +0100
Subject: [Buildroot] [Next] package/python-bunch: new package
In-Reply-To: <20191112210300.17792-1-matthew.weber@rockwellcollins.com>
References: <20191112210300.17792-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191119173530.09da9d6c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Nov 2019 15:03:00 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/python-bunch/Config.in         |  6 ++++++
>  package/python-bunch/python-bunch.hash |  5 +++++
>  package/python-bunch/python-bunch.mk   | 14 ++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/python-bunch/Config.in
>  create mode 100644 package/python-bunch/python-bunch.hash
>  create mode 100644 package/python-bunch/python-bunch.mk

The entry in the DEVELOPERS file was missing, so I've added that. Then
I pushed, and realized the package was also not added to
package/Config.in, so I did a follow-up commit to fix that. Both to the
next branch, of course.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
