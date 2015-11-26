From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:42:37 +0100
Subject: [Buildroot] [PATCH 1/1] conntrack-tools: add patch to fix build
	with musl
In-Reply-To: <1448256490-8383-1-git-send-email-rprebello@gmail.com> (Rodrigo
 Rebello's message of "Mon, 23 Nov 2015 03:28:10 -0200")
References: <1448256490-8383-1-git-send-email-rprebello@gmail.com>
Message-ID: <87610otp2q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rodrigo" == Rodrigo Rebello <rprebello@gmail.com> writes:

 > The conntrack-tools sources use the GNU version of 'struct tcphdr',
 > which is not exposed by the musl headers unless _GNU_SOURCE is defined.

 > The included patch adds the missing definition to 'src/helpers/rpc.c'.

 > Fixes:

 >   http://autobuild.buildroot.net/results/046/04613c47b9669c28cc3ff47c65607c23730ef691/
 >   http://autobuild.buildroot.net/results/520/520e8f327b9bd7eea59657bad702c35c632d115d/
 >   http://autobuild.buildroot.net/results/3d3/3d36403ba80089faea5dd06bc7e4414d593bbfc1/
 >   ...

 > Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
