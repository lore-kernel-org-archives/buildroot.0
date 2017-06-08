From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:42:46 +0200
Subject: [Buildroot] [PATCH] support/dependencies: check PATH does not
 carry a \n
In-Reply-To: <20170520082005.11668-1-yann.morin.1998@free.fr>
References: <20170520082005.11668-1-yann.morin.1998@free.fr>
Message-ID: <20170608214246.5acc565c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 May 2017 10:20:05 +0200, Yann E. MORIN wrote:

> +    # Break the '\n' sequence, or a \n is printed (which is not what we want).
> +    printf "Your PATH contains a newline (%sn) charater.\n" "\\"

Typo: character.

> +    printf "This doesn't work. Fix you PATH.\n"
> +    exit 1
> +    ;;

Also, we use one tab for indentation in this file, not 4 spaces, so
I've fixed that.

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
