From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 20:16:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: amdgpu needs MMU
In-Reply-To: <20190311222630.17241-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 11 Mar 2019 23:26:30 +0100")
References: <20190311222630.17241-1-fontaine.fabrice@gmail.com>
Message-ID: <87imw6lq6t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > amdgpu test uses fork() so disable amdgpu without MMU
 > Fixes:
 >  - http://autobuild.buildroot.org/results/8d6194982c1080e173fcef8212fb06e6dc275d58

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
