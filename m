From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2017 14:12:45 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-23
In-Reply-To: <901801527.12088604.1487934060090.JavaMail.zimbra@datacom.ind.br>
References: <20170224072852.CAF2822947@mail.free-electrons.com>
 <901801527.12088604.1487934060090.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170224141245.71bf2eb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Feb 2017 08:01:00 -0300 (BRT), Carlos Santos wrote:
> > Build statistics for 2017-02-23  
> [...]
> >        host-util-linux-2.29.2 | 1  
> 
> ERROR: certificate common name `k.ssl.fastly.net' doesn't match requested host name `cdn.kernel.org'.

This gets automatically solved by sources.buildroot.net caching the
tarball. However, since I agree that it happens quite regularly,
perhaps we could add some logic in autobuild-run to detect such build
failures and ignore them?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
