From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Sep 2016 22:43:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: bump to version 4.6.0.245
In-Reply-To: <1474920079-30330-2-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Mon, 26 Sep 2016 22:01:19 +0200")
References: <1474920079-30330-1-git-send-email-angelo.compagnucci@gmail.com>
 <1474920079-30330-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87eg462y02.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > * Bump to mono 4.6.0.245
 > * Enabling previously disabled aot cause this version doesn't
 >   compile without

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Did something get relicensed?

make mono-legal-info
[..]
cat: /home/peko/source/buildroot/output/build/mono-4.6.0.245/mcs/COPYING.LIB: No such file or directory
package/mono/mono.mk:67: recipe for target 'mono-legal-info' failed

-- 
Bye, Peter Korsgaard
