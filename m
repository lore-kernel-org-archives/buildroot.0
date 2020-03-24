From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:17:45 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/python-jinja2: fix runtime
 python modules dependencies
In-Reply-To: <20200322213925.945-1-ps.report@gmx.net>
References: <20200322213925.945-1-ps.report@gmx.net>
Message-ID: <20200324221745.2595ea87@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 22:39:24 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - add python unicodedata runtime dependency, fixes:
>   File "usr/lib/python3.8/site-packages/jinja2/lexer.py", line 46, in <module>
>   ModuleNotFoundError: No module named 'unicodedata'
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - add missing signed off by (spotted by Thomas Petazzoni)
> ---
>  package/python-jinja2/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
