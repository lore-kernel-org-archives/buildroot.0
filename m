From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Mar 2008 22:35:23 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  jamvm
In-Reply-To: <20080306181346.D91851201EC@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 6 Mar 2008 10\:13\:46 -0800 \(PST\)")
References: <20080306181346.D91851201EC@busybox.net>
Message-ID: <873ar3fsdg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

Hi,

 ninevoltz> +config BR2_PACKAGE_JAMVM
 ninevoltz> +	bool "jamvm"
 ninevoltz> +	default n
 ninevoltz> +        depends on BR2_PACKAGE_CLASSPATH
 ninevoltz> +
 ninevoltz> +	help
 ninevoltz> +	  JamVM is a new Java Virtual Machine which conforms to the JVM specification version 2 (blue book). 

Please keep the line length sane (E.G. <70 chars).

-- 
Bye, Peter Korsgaard
