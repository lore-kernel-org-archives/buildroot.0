From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:55:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] dbus-triggerd: new package
In-Reply-To: <1395905999-25181-1-git-send-email-rebillout@syscom.ch>
References: <1395905999-25181-1-git-send-email-rebillout@syscom.ch>
Message-ID: <20140329185548.311b0cd6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnaud R?billout,

On Thu, 27 Mar 2014 08:39:59 +0100, Arnaud R?billout wrote:
> dbus-triggerd is a little daemon that can monitor dbus events, match
> them against some watch-expressions, then trigger shell-commands.
> 
> It can be used in any situation where dbus-interaction is needed, and
> shell script is preferred over other languages.
> 
> Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>

Applied, thanks. I've just added $(TARGET_MAKE_ENV) in the environment,
for good measure, even if it wasn't strictly necessary in the current
situation.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
