From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:59:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/thrift: drop unneeded static
 openssl workaround
In-Reply-To: <20190413083858.12941-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 13 Apr 2019 10:38:58 +0200")
References: <20190413083858.12941-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm0v9ntu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > thrift uses pkg-config to find openssl dependencies such as lz or
 > latomic so drop unneeded workaround

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
