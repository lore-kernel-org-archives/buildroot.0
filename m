From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:49:10 +0200
Subject: [Buildroot] [PATCH v3 6/7] .gitlab-ci.yml: check flake8
In-Reply-To: <1520910585-19097-7-git-send-email-ricardo.martincoski@gmail.com>
References: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
 <1520910585-19097-7-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180331224910.3b5ad573@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Mar 2018 00:09:44 -0300, Ricardo Martincoski wrote:
> Add a test to check Python code style in the whole buildroot tree.
> 
> Search files by type in order to help flake8 to find the Python scripts
> without .py extension. But don't rely only in the output of 'file' as it
> uses heuristics and sometimes it is wrong (specially identifying Python
> files as C++ source for the 'file' version currently in the Docker
> image).
> 
> Include in the output:
>  - the list of Python files processed;
>  - statistics for each kind of warning;
>  - the total number of warnings;
>  - the number of Python files processed.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
