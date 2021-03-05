From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Mar 2021 23:22:28 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/libshout: disable tools
In-Reply-To: <20210305150054.2007286-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 5 Mar 2021 16:00:54 +0100")
References: <20210305150054.2007286-1-fontaine.fabrice@gmail.com>
Message-ID: <87czwdb5qz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This will fix static build of libshout in version 2.4.5 with openssl
 > (tools were added by
 > https://gitlab.xiph.org/xiph/icecast-libshout/-/commit/34a535bdbb7d8bb4545d2bd71ba29a212e83041e)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1c2885d75219aabadbb66ab66fe0dc4b4346ff1e

This looks to be a kismet failure. I've replaced by:

http://autobuild.buildroot.net/results/a6b/a6b7df5d4b4bccbfe54f3173365e88d849ed0e30/

And committed, thanks.

-- 
Bye, Peter Korsgaard
