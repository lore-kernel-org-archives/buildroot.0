From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:39:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: use pkg-config to
 find openssl
In-Reply-To: <20190322203459.27576-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 22 Mar 2019 21:34:59 +0100")
References: <20190322203459.27576-1-fontaine.fabrice@gmail.com>
Message-ID: <87y34zmj74.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > openssl can have multiples dependencies such as libatomic on sparcv8
 > 32 bits so drop first patch and add a new patch to use pkg-config

 > Fixes:
 >  - http://autobuild.buildroot.org/results/58e5aa7c6ba8fe7474071d7a3cba6ed3a1b4cff4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
