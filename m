From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 10 Nov 2012 15:28:42 +0100
Subject: [Buildroot] Various problem using buildroot-2012.05
References: <1340005565.16617.YahooMailClassic@web161402.mail.bf1.yahoo.com>
 <20120618103657.721db39b@skate>
Message-ID: <qaol7k.eta.ln@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20120618103657.721db39b at skate:

> Le Mon, 18 Jun 2012 00:46:05 -0700 (PDT),
> Ming-Ching Tiew <mctiew@yahoo.com> a ??crit :
>> Because there are many packages are not made to compile in a cross
>> environment. For many, it's not a trial task to adapt those packages
>> for cross compiling. 
> Which packages are you talking about? If there are of general interest,
> some people might be interested in helping to get them to cross-compile.

Hi,

in my case it?s Perl, along with Spamassassin to be build on-top of it. The 
current effort to cross-compile Perl is problematic in regard to cross-
compile CPAN modules, so now I am trying to compile Perl on the target 
machine using a buildroot-made gcc_target toolchain along with some 
dependency libs.

Kind regards, Bernd
