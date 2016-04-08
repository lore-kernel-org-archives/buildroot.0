From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Apr 2016 22:12:18 +0200
Subject: [Buildroot] [PATCH 2/2] weston: don't forcibly disable simple
	EGL clients
In-Reply-To: <1460122521-19079-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 8 Apr 2016 10:35:21 -0300")
References: <1460122521-19079-1-git-send-email-gustavo@zacarias.com.ar>
 <1460122521-19079-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87shyvoo65.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Only do so when there's no EGL.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
