From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Mar 2015 11:50:37 +0100
Subject: [Buildroot] [PATCH 1/1] perl-file-util: new package
In-Reply-To: <1149779921.3174899.1425159102229.JavaMail.zimbra@datacom.ind.br>
References: <1425061661-3190-1-git-send-email-casantos@datacom.ind.br>
 <20150228113933.00d7ac8e@free-electrons.com>
 <1149779921.3174899.1425159102229.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20150301115037.53e2cffc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Feb 2015 18:31:42 -0300 (BRT), DATACOM - casantos wrote:

> At the company I work for (DATACOM) we use a third-party software by
> whose compilation is performed by a set of Perl scripts which use the
> File::Util module. That's why we need the host package. Of course we
> could use the Perl packages provided by the host OS but we prefer to
> reduce the dependency on locally installed packages in order to
> reduce dependencies with regard to the host OS.

Ok. It would be good to indicate this in the commit log, because your
patch adds a host package without any way to build it, unless another
custom package is added with a dependency on host-perl-file-util.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
