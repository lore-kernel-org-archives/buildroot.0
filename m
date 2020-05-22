From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2020 09:42:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/binutils: install libopcodes
 for perf
In-Reply-To: <20200513195524.GY12536@scaer> (Yann E. MORIN's message of "Wed, 
 13 May 2020 21:55:24 +0200")
References: <20200513170233.2983421-1-lecopzer@gmail.com>
 <20200513195524.GY12536@scaer>
Message-ID: <87367smn5b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Lecopzer, All,
 > On 2020-05-14 01:02 +0800, Lecopzer Chen spake thusly:
 >> After 5.6.x linux-tool perf installed, it can't be executed due
 >> to lack of libopcodes:
 >> 
 >> perf: ...libopcodes-2.33.1.so: cannot open shared object file
 >> 
 >> Signed-off-by: Lecopzer Chen <lecopzer@gmail.com>

 > Applied to master, with an expanded commit log to reference the origianl
 > commit adding libopcodes to staging. Thanks!

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
