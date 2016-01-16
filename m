From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 13:51:12 +0100
Subject: [Buildroot] [PATCH] support/scripts: add size-stats-compare
 script
In-Reply-To: <56998EA7.5020603@mind.be>
References: <1452872492-6980-1-git-send-email-patrickdepinguin@gmail.com>
 <56998EA7.5020603@mind.be>
Message-ID: <20160116135112.52d70412@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, 16 Jan 2016 01:28:23 +0100, Arnout Vandecappelle wrote:

>  I think you should also add a reference to the script to
> docs/manual/common-usage.txt. No full documentation is needed, you can just
> point to the --help option (otherwise it would just get out of sync).

Agreed.


> > +# This code relies on the output CSV files of 'make graph-size'. If you
> > +# are comparing to an older Buildroot release, you can consider backporting
> > +# that feature. See commits:
> > +#    99aca138c20e1259ac8c23252c223e150d460482 (instrumentation hook)
> > +#    598c80be8fc7b5ddfcba6f7715d90757033723ef (size-stats script)
> > +#    24c75fbb38ffeb5c5a7278cf40f4f7cf867502e0 (make graph-size)
> 
>  I think this documentation should be part of the argparse description.

I tend to disagree here, and instead who advocate to not have such
documentation at all. Nowhere do we document which commits should be
backported to bring this or that feature to an older Buildroot release,
and I don't think we should start doing this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
