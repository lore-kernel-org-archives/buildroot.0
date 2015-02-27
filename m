From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 15:44:06 +0100
Subject: [Buildroot] [git commit] libevent: fix openssl detection when
	statically linking
In-Reply-To: <20150227153056.181ef6f3@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 27 Feb 2015 15:30:56 +0100")
References: <20150227082309.25DB7817F6@busybox.osuosl.org>
 <20150227153056.181ef6f3@free-electrons.com>
Message-ID: <87y4nj1kjt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Fri, 27 Feb 2015 08:54:33 +0100, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=f29bb169cff521e01f9e94af7275a4e110d256bc
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Fixes (indirectly):
 >> http://autobuild.buildroot.net/results/dbf/dbf2d348de3831a86728f9d72cb56b9f2ddbf554/
 >> http://autobuild.buildroot.net/results/6a8/6a89183e558e4ff27841c3e544687ad4a04fb036/
 >> http://autobuild.buildroot.net/results/c80/c80eedb4d7335f1aef736a1312900c2b371eabc9/
 >> http://autobuild.buildroot.net/results/91b/91b4ab54ed9d422bfaef765d09cc92192012ce7e/
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Gaaah. See the proper solution I had already posted at
 > http://lists.busybox.net/pipermail/buildroot/2015-February/119998.html.

That also looks ok. Did you try submitting it upstream?

Just passing OPENSSL_LIBADD seems like a safer approach this close to
the release though (E.G. tonight).

-- 
Peter Korsgaard 
