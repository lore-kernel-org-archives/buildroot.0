From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Feb 2015 15:57:30 +0100
Subject: [Buildroot] [PATCH 1/1] webkit : fix single line comments
In-Reply-To: <1423402220-10090-1-git-send-email-sagaert.johan@skynet.be>
References: <1423402220-10090-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20150208155730.2a1b569e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun,  8 Feb 2015 14:30:20 +0100, Sagaert Johan wrote:
> 
> Single line comments generate an error and break the build.
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

This looks weird. Single line comments are perfectly acceptable in C++
and in C99. What error are you getting, and in which situation?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
