From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:35:39 +0100
Subject: [Buildroot] [PATCH] support/script/scancpan: remove duplicated
 dependency
In-Reply-To: <1418153523-10972-1-git-send-email-francois.perrad@gadz.org>
References: <1418153523-10972-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20141209203539.3d07e284@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Tue,  9 Dec 2014 20:32:03 +0100, Francois Perrad wrote:
> dependency from metacpan comes as a list of module
> which is transformed in a list of distribution for BR.
> different modules could be included in the same distribution,
> so duplication is possible.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks. Could you give an example of a CPAN module which exhibits the
issue, so non-Perl people like me can test the effect of your patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
