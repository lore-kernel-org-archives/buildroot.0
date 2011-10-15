From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Oct 2011 23:16:37 +0200
Subject: [Buildroot] [PATCH 15/25] vala: new package
In-Reply-To: <1318648059-30431-15-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 15 Oct 2011 00:07:29 -0300")
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
 <1318648059-30431-15-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k486rm4q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> +++ b/package/vala/vala.mk
 Gustavo> @@ -0,0 +1,15 @@
 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# vala
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +VALA_VERSION = 0.12.1

Nice, any specific reason to not go with 0.14 instead?

-- 
Bye, Peter Korsgaard
