From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:35:08 +0100
Subject: [Buildroot] [PATCH] package/radvd: drop dependency on flex
 runtime library
In-Reply-To: <20200320100720.1850-1-alexander.i.mukhin@gmail.com> (Alexander
 Mukhin's message of "Fri, 20 Mar 2020 13:07:20 +0300")
References: <20200320100720.1850-1-alexander.i.mukhin@gmail.com>
Message-ID: <874ku9dj9v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Mukhin <alexander.i.mukhin@gmail.com> writes:

 > Radvd has its own main(), and does not use yywrap() from libfl.so,
 > because scanner.l module contains noyywrap option. So, none of the
 > functions exported by libfl.so are used, and there's no need to have
 > the flex runtime on target.

 > Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

Committed to 2020.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
