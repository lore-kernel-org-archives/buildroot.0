From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Mar 2016 11:57:11 +0100
Subject: [Buildroot] Autobuilder update
In-Reply-To: <20160311094223.6b433df0@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 11 Mar 2016 09:42:23 +0100")
References: <20160310234742.3df6dff2@free-electrons.com>
 <E1aeFbm-0004jE-Q7@fli4l.lan.fli4l>
 <20160311094223.6b433df0@free-electrons.com>
Message-ID: <87a8m5jn94.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > By default we use i586, right? So what you suggest is an i586 defconfig?

 > Now we have two options:

 >  - Use an internal toolchain configuration, which means that the
 >    toolchain is rebuilt everytime, and when we want on our side to
 >    reproduce the build failures, we also have to rebuild the toolchain.

 >  - Use a pre-built external toolchain.

 > I'm leaning twoards the second option. What do you think?

It depends on how much we're otherwise testing the internal toolchain? I
agree that using an external toolchain is more efficient, but we should
imho do "some" builds with the internal toolchain on various archs as
well.

-- 
Bye, Peter Korsgaard
