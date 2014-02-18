From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 23:33:27 +0100
Subject: [Buildroot] [PATCH v2 09/20] python3: provide a PYTHON3_PATH
In-Reply-To: <87eh302gws.fsf@dell.be.48ers.dk>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <87eh302gws.fsf@dell.be.48ers.dk>
Message-ID: <20140218233327.75a9e5a0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 18 Feb 2014 23:29:55 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > The Python package infrastructure will need the Python 3 package to
>  > provide a PYTHON3_PATH environment variable in order to build
>  > third-party Python modules.
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Committed to next, thanks.
> 
> This btw didn't cleanly apply with git am.

Most likely due to PATCH 06/20 not being applied, since the changes are
close. I did test the removal of PATCH 06/20 by doing an interactive
rebase, so the result might be slightly different than with git am.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
