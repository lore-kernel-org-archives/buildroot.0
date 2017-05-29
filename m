From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:39:32 +0200
Subject: [Buildroot] [PATCH 1/1] Added notes to the mosh package help to
 clarify run time issues.
In-Reply-To: <1496082575-24450-1-git-send-email-glbsalazar@gmail.com>
References: <1496082575-24450-1-git-send-email-glbsalazar@gmail.com>
Message-ID: <20170529223932.2acf7216@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 19:29:35 +0100, Gon?alo Salazar wrote:
> Added notes to the mosh package help to clarify some
> issues related with it to ensure mosh will work properly after adding it.
> This includes adding a proper LOCALE on the host and an extra flag when using
> mosh with dropbear.

The commit title should start with the name of the package, i.e:

	mosh: add notes to clarify runtime issues

>  	  https://mosh.mit.edu

The notes should go before the upstream URL, and the indentation should
be one tab + two spaces.

> +
> +          Mosh requires a host LOCALE matching the client provided LOCALE.

I'm sorry, but I don't understand this sentence.

> +          When using mosh with dropbear, a version with the --no-ssh-pty option on
> +          the client is required.

And also this one.

So for me, those explanations do not clarify anything :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
