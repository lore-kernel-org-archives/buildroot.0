From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2015 22:46:30 +0100
Subject: [Buildroot] [PATCH 6/6] core/pkg-infrastructures: remove
	LD_LIBRARY_PATH from the environment
In-Reply-To: <0a14a9ff7f39c78d2a39f8ccde40a9f7a6d020b2.1447449754.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 13 Nov 2015 22:48:52 +0100")
References: <cover.1447449754.git.yann.morin.1998@free.fr>
 <0a14a9ff7f39c78d2a39f8ccde40a9f7a6d020b2.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <87bnarasll.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Ben Boeckel <mathstuf@gmail.com>
 > If system tools are selected, the host's lib/ directory may shadow
 > libraries from the system which are configured differently and do not
 > have all of the symbols required by the system tool.

 > Since buildroot now uses rpath everywhere, LD_LIBRARY_PATH should not
 > be necessary anyways.

 > Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
