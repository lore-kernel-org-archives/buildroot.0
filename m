From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 22:38:13 +0100
Subject: [Buildroot] Broken link in build notification
In-Reply-To: <7d2636ad-5201-10d9-fe72-4d1001a94c72@gmail.com> (Zoltan
 Gyarmati's message of "Mon, 22 Jan 2018 21:25:44 +0100")
References: <20180121070008.0687520885@mail.free-electrons.com>
 <7d2636ad-5201-10d9-fe72-4d1001a94c72@gmail.com>
Message-ID: <87po61o9q2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zoltan" == Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> writes:

 > Dear Thomas &All,
 > On 01/21/2018 08:00 AM, Thomas Petazzoni wrote:
 >> Hello,
 >> 
 >> This is the list of Buildroot build failures that occured on
 >> 2018-01-20, and for which you are a registered architecture developer
 >> or package developer. Please help us improving the quality of
 >> Buildroot by investigating those build failures and sending patches to
 >> fix them. Thanks!
 >> 
 >> Results for the 'master' branch
 >> ===============================
 >> 
 >> Build failures related to your packages:
 >> 
 >> arm | proj-4.9.3 |
 >> http://autobuild.buildroot.net/results/80243a2ae19190d75e84a2ed8aa4b95a20ea9ef0
 >> 

 > I received this ^^ build error notification mail yesterday.

 > The link redirects to
 > https://bugs.busybox.net/results/80243a2ae19190d75e84a2ed8aa4b95a20ea9ef0,
 > and ends up in a 404.

Sorry, my fault. I am moving sources.buildroot.net to a new VM / behind
cloudflare, and DNS for autobuild.buildroot.net temporarily pointed at
the VM running bugs.busybox.net instead of the autobuild master.

There's also a few autobuilder failures because of this.

It should be fixed now, and sources.buildroot.net should be faster now.

-- 
Bye, Peter Korsgaard
