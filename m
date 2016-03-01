From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 09:14:03 +0100
Subject: [Buildroot] [PATCH] pkgconf: Add a symlink to the
 GNU_TARGET_NAME-pkg-config
In-Reply-To: <87y4a3m7v5.fsf@dell.be.48ers.dk>
References: <1456770170-6326-1-git-send-email-jer@airfi.aero>
 <u7ieqcx9kv.ln2@ID-313208.user.individual.net>
 <20160229213520.2b6e6ee7@free-electrons.com>
 <87y4a3m7v5.fsf@dell.be.48ers.dk>
Message-ID: <20160301091403.2b7ce2fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, 01 Mar 2016 00:09:34 +0100, Peter Korsgaard wrote:

>  > What I dislike with the current setup is that if you add
>  > $(HOST_DIR)/usr/bin to your PATH, then any call to pkg-config returns
>  > values that are valid only when cross-compiling, which is not
>  > necessarily what one would expect.
> 
> On the other hand, the situations where you add it to the path are often
> where you _DO_ want to cross compile.

Indeed, but you often end up doing both cross-compilation and native
compilation, and it's pretty easy to get confused by a pkg-config
returning absurd values.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
