From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 00:27:02 +0100
Subject: [Buildroot] [PATCHv3 59/74] transmission: install init script
	unconditionally
In-Reply-To: <20141130174628.GO4124@free.fr> (Yann E. MORIN's message of "Sun, 
 30 Nov 2014 18:46:28 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-60-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141130174628.GO4124@free.fr>
Message-ID: <87h9xf54u1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
 >> As discussed, users should use a rootfs overlay or a post-build script
 >> instead of a custom skeleton to override files installed by Buildroot,
 >> so there is no point in having conditions when installing init scripts
 >> or configuration files.
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > Acked-by: ME

Missing macro expansion? I've fixed that up before committing.

-- 
Bye, Peter Korsgaard
