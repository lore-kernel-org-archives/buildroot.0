From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 23:39:55 +0100
Subject: [Buildroot] [PATCH] busybox: add 1.21.x series
In-Reply-To: <1358806463-14501-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 21 Jan 2013 19:14:23 -0300")
References: <1358806463-14501-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87libm88jo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

 Gustavo> +# System Logging Utilities
 Gustavo> +#
 Gustavo> +CONFIG_SYSLOGD=y
 Gustavo> +CONFIG_FEATURE_ROTATE_LOGFILE=y
 Gustavo> +CONFIG_FEATURE_REMOTE_LOG=y
 Gustavo> +# CONFIG_FEATURE_SYSLOGD_DUP is not set
 Gustavo> +# CONFIG_FEATURE_SYSLOGD_CFG is not set
 Gustavo> +CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
 Gustavo> +# CONFIG_FEATURE_IPC_SYSLOG is not set
 Gustavo> +CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
 Gustavo> +# CONFIG_LOGREAD is not set
 Gustavo> +# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
 Gustavo> +# CONFIG_FEATURE_KMSG_SYSLOG is not set

Ahh come on, don't like my syslog-to-kmsg feature? ;)

-- 
Bye, Peter Korsgaard
