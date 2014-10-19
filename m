From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 23:01:32 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 02/11] autobuild-run:
 convert regular function comments into docstrings
In-Reply-To: <1413747007-24990-3-git-send-email-patrickdepinguin@gmail.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
 <1413747007-24990-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20141019230132.08684183@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 19 Oct 2014 21:29:58 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Documenting a function in Python is done with docstrings, rather than
> with comments above the function. The conventions are described in
> PEP257: http://legacy.python.org/dev/peps/pep-0257/
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
> v2: rebase after reordering

Even though I find regular comments easier to read, let's use the
Pythonist way of documenting stuff. Patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
