From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2014 22:24:17 +0100
Subject: [Buildroot] [PATCH 1/3] arc: add explicit selection of CPU
	templates ARC 750D and ARC770D
In-Reply-To: <1414677449-15937-2-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 30 Oct 2014 16:57:27 +0300")
References: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
 <1414677449-15937-2-git-send-email-abrodkin@synopsys.com>
Message-ID: <878ujt5m9q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > This separation allows to specify unique options and features for each
 > CPU.

 > For example ARC 770D has LLOCK/SCOND instructions built-in by default.
 > Also this new scheme simplifies selection of proper configuration for
 > users - preconfigured options now match templates for ARC CPUs.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
