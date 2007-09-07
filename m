From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 7 Sep 2007 15:14:47 +0200
Subject: [Buildroot] this commit breaks x86_64 toolchain builds
In-Reply-To: <e83232070709060559u27a12f78u1ddb96d7c4d7bc20@mail.gmail.com>
References: <e83232070709060559u27a12f78u1ddb96d7c4d7bc20@mail.gmail.com>
Message-ID: <20070907131447.GD17733@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 06, 2007 at 10:59:56PM +1000, Roderick Taylor wrote:
>x86_64, by default uses the lib64 directory to hold 64-bit libraries.
>not the lib directory as assumed by this commit.

I don't see how the patch mentioned below is the culprit?
>
>http://buildroot.busybox.net/cgi-bin/viewcvs.cgi?rev=19702&view=rev

Isn't there a target_gcc_lib_dir we should rather use?
