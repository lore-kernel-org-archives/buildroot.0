From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 21:59:59 +0100
Subject: [Buildroot] [PATCH v4] mtree: new package
In-Reply-To: <20190328210043.41fc2c0d@windsurf> (Thomas Petazzoni's message of
 "Thu, 28 Mar 2019 21:00:43 +0100")
References: <20190326142411.6943-1-esben.haabendal@gmail.com>
 <20190327201803.6b1a832d@windsurf> <87bm1w9ck5.fsf@haabendal.dk>
 <20190328121441.02648d09@windsurf> <87tvfnav5a.fsf@gmail.com>
 <02a2e44d-45e9-f3fc-8c1f-5cf7a8b8f5d8@mind.be>
 <20190328210043.41fc2c0d@windsurf>
Message-ID: <87ef6qlnow.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 28 Mar 2019 19:13:16 +0100
 > Arnout Vandecappelle <arnout@mind.be> wrote:

 >> > I think I will give option 2 a try.  Sounds like a nice solution :-)  
 >> 
 >> To be honest, I'm more inclined to remove the -U completely and add an
 >> autobuilder exception... I don't believe we have to go too far to work around
 >> bugs in old toolchains.

 > I'm fine with this as well. It means we would no longer support glibc
 > 2.19 anymore.

Didn't you just last month argue against removing support for glibc <
2.19 support (the runc security fix):

http://lists.busybox.net/pipermail/buildroot/2019-February/244056.html

I don't have a problem dropping support for ancient toolchains when they
add too much complexity, but the lack of large file support is mtree is
probably not really reason enough.

-- 
Bye, Peter Korsgaard
