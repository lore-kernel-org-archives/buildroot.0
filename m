From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 07:31:31 +0100
Subject: [Buildroot] Changing permission recursively
In-Reply-To: <20150312175527.GO2177@tarshish>
References: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
 <20150312175527.GO2177@tarshish>
Message-ID: <20150313073131.7a16aeb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 12 Mar 2015 19:55:28 +0200, Baruch Siach wrote:

> How about running the following from a post build script (untested):
> 
> 	${HOST_DIR}/usr/bin/fakeroot -- chown -R UID:GID ${1}/path/to/directory

Does this actually works ?

My understanding of fakeroot is that you have to execute all the
fakeroot'ed commands under the same fakeroot invocation for the changes
made by these commands to actually have an effect.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
