From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 23:26:09 +0100
Subject: [Buildroot] [PATCH v2 1/1] support/scripts/mkmakefile: Wrapper
 is silent by default
In-Reply-To: <20181102112933.14823-1-serj.kalichev@gmail.com> (Serj Kalichev's
 message of "Fri, 2 Nov 2018 14:29:33 +0300")
References: <20181026112621.8146-1-serj.kalichev@gmail.com>
 <20181102112933.14823-1-serj.kalichev@gmail.com>
Message-ID: <87wopfthxa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Serj" == Serj Kalichev <serj.kalichev@gmail.com> writes:

 > Suppose we use Makefile wrapper and build some
 > project out of buildroot tree (O=...). The commands like "make
 > busybox-all-external-deps" will output the string "uname 022 && make ..." to
 > stdout before the usefull information. It pollutes stdout. In the same time
 > if we use the same command in the buildroot source-tree then we don't get the
 > additional output. This patch makes wrapper silent by default. People who
 > prefer to see more verbose output can use V=1.

 > Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
