From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Mar 2021 23:15:21 +0100
Subject: [Buildroot] [PATCH] package/janet: add -std=c99 to CFLAGS
In-Reply-To: <20210304175428.1132524-1-b.bilas@grinn-global.com> (Bartosz
 Bilas's message of "Thu, 4 Mar 2021 18:54:28 +0100")
References: <20210304175428.1132524-1-b.bilas@grinn-global.com>
Message-ID: <87k0qlb62u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:

 > As upstream says Janet should be compiled with -std=c99
 > so pass this in order to fix the failures below.

 > Fixes:
 >  http://autobuild.buildroot.net/results/192/1922ec115b9dc9e879760a6868969d9677093510/build-end.log
 >  ...
 >  http://autobuild.buildroot.net/results/355/355e0992338a8d132050517f83a3884606b00529/build-end.log

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
