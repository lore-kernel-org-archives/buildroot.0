From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:31:30 +0200
Subject: [Buildroot] [PATCH] package/python-crossbar: add missing
 runtime dependency on python-werkzeug
In-Reply-To: <20200408213000.212212-1-romain.naour@gmail.com>
References: <20200408213000.212212-1-romain.naour@gmail.com>
Message-ID: <20200411103130.4a0480d2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Apr 2020 23:30:00 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Upstream commit
> https://github.com/crossbario/crossbar/commit/b9c295d3cfa923b383f93fe534d40e42c56576dc
> which has been part of the releases since v19.10.1 has added
> werkzeug dependency.
> 
> Without werkzeug package, the test TestPythonPy3Crossbar
> is failing at runtime with this error:
> 
> ModuleNotFoundError: No module named 'werkzeug'
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144523
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-crossbar/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
