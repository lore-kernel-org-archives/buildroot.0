From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 15:53:38 +0100
Subject: [Buildroot] [PATCH v2 1/2] scripts/pycompile: Accomodate latest
 Python 3 codebase
In-Reply-To: <20170314234228.3744-1-andrew.smirnov@gmail.com>
References: <20170314234228.3744-1-andrew.smirnov@gmail.com>
Message-ID: <20170319155338.66019ee6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 16:42:27 -0700, Andrey Smirnov wrote:
> As of the version 3.6.0 compile_dir() call will treat its 'quiet'
> argument as a full blown integer rather than a boolean value and perform
> integer comparison operations such as '<' or '>='.
> 
> To account for that convert ReportProblem type to be a true derivative
> of built-in int() and override all of int's rich comparison operators in
> order to be able to "sinff" for PyCompileError in all possible use-cases
> 
> The integer value ReportProblem pretends to be is teremined by class
> variable VALUE which is set to 1.
> 
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
