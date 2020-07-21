From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:51:31 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: add /etc/bash_completion.d to
 non-bash purge
In-Reply-To: <20200714022459.1926-1-danomimanchego123@gmail.com> (Danomi
 Manchego's message of "Mon, 13 Jul 2020 22:24:59 -0400")
References: <20200714022459.1926-1-danomimanchego123@gmail.com>
Message-ID: <87zh7slhgs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Currently, we delete /usr/share/bash-completion when bash is not enabled.
 > We need to delete /etc/bash_completion.d too. For example, the jo package
 > installs files there:

 > /etc/bash_completion.d/jo.bash

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
