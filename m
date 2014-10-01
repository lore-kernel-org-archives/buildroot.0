From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Oct 2014 14:02:37 +0200
Subject: [Buildroot] [PATCH] libvncserver: add security patches
In-Reply-To: <1412118774-1082-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 30 Sep 2014 20:12:54 -0300")
References: <1412118774-1082-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lhp0ngki.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-6051 and
 > CVE-2014-6052 denial of service and possible code execution via
 > integer overflow and lack of malloc error handling in
 > MallocFrameBuffer()
 > CVE-2014-6053 denial of service via large ClientCutText message.
 > CVE-2014-6054 denial of service via zero scaling factor.
 > CVE-2014-6055 denial of service and possible code execution via
 > stack overflows in File Transfer feature.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
